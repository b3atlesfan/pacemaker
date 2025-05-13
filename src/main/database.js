const { Client } = require('pg');

const DB_NAME = 'my_database'; 
const DB_USER = 'postgres';
const DB_PASSWORD = '@9oUy9$eh3Ay^ofabG';
const DB_HOST = 'localhost';
const DB_PORT = 5432;

var dbClient

// Function to create the database and tables
async function setupDatabase() {
    dbClient = new Client({
        user: DB_USER,
        host: DB_HOST,
        password: DB_PASSWORD,
        port: DB_PORT,
    });
    try {
        await dbClient.connect();
    }
    catch (error) {
        console.error('Error connecting to the database:', error);
        return;
    }

    const res = await dbClient.query(`SELECT datname FROM pg_catalog.pg_database WHERE datname = '${DB_NAME}'`);

    if (res.rowCount === 0) {
        console.log(`${DB_NAME} database not found, creating it.`);
        await dbClient.query(`CREATE DATABASE "${DB_NAME}";`);
        console.log(`created database ${DB_NAME}`);
    } else {
        console.log(`${DB_NAME} database exists.`);
    }


    // Create the tables if they don't exist
    await dbClient.query(`
        CREATE TABLE IF NOT EXISTS runs (
            run_id SERIAL PRIMARY KEY,
            timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
    `);

    
    await dbClient.query(`
        CREATE TABLE IF NOT EXISTS beats (
            run_id INT NOT NULL,
            beat_id INT NOT NULL,
            timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (beat_id, run_id),
            FOREIGN KEY (run_id) REFERENCES runs(run_id)
        );

    `);


    await dbClient.query(`
        CREATE TABLE IF NOT EXISTS events (
            event_id SERIAL PRIMARY KEY,
            run_id INT NOT NULL,
            beat_id INT,
            type VARCHAR(255) NOT NULL,
            timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (run_id) REFERENCES runs(run_id),
            FOREIGN KEY (run_id, beat_id) REFERENCES beats(run_id, beat_id)
        );
    `); 

    await dbClient.query(`
        CREATE TABLE IF NOT EXISTS variable_changes (
            variable_change_id SERIAL PRIMARY KEY,
            event_id INT NOT NULL,
            name_and_path VARCHAR(255) NOT NULL,
            new_value DOUBLE PRECISION NOT NULL,
            diff DOUBLE PRECISION NOT NULL,
            FOREIGN KEY (event_id) REFERENCES events(event_id)
        );
    `);

    await dbClient.query(`
SELECT setval(pg_get_serial_sequence('events', 'event_id'), (SELECT MAX(event_id) FROM events));
`);


    //await dbClient.query('CREATE INDEX IF NOT EXISTS idx_variable_changes_run_id ON variable_changes(run_id)');
    //await dbClient.query('CREATE INDEX IF NOT EXISTS idx_variable_changes_beat_id ON variable_changes(beat_id)');
    //await dbClient.query('CREATE INDEX IF NOT EXISTS idx_variable_changes_event_id ON variable_changes(event_id)');
    //await dbClient.query('CREATE INDEX IF NOT EXISTS idx_variable_changes_name_and_path ON variable_changes(name_and_path)');

    console.log('Database setup complete');
}

async function createRun() {
    const query = 'INSERT INTO runs (timestamp) VALUES (now()::timestamp) RETURNING run_id';
    const res = await dbClient.query(query);
    return res.rows[0].run_id;
}

let lastRunId = 0;
let _eventId = -1;

async function computeBeats(runId) {
    const queryBeat = `INSERT INTO beats (run_id, beat_id, timestamp)
SELECT run_id, 
       (SELECT COUNT(*) - 1 
        FROM events e2 
        WHERE e2.type = 'checkpointReached' AND e2.run_id = $1) AS beat_id, 
       timestamp
FROM events e
WHERE e.type = 'checkpointReached' AND e.run_id = $1
LIMIT 1;
`;
    await dbClient.query(queryBeat, [runId]);
}

async function updateEvents() {
    const queryUpdate = `UPDATE events e
SET beat_id = b.max_beat_id
FROM (
    SELECT run_id, MAX(beat_id) AS max_beat_id
    FROM beats
    GROUP BY run_id
) b
WHERE e.run_id = b.run_id
AND e.beat_id IS NULL;`
    await dbClient.query(queryUpdate);
}

const storeEvent = async(runId, type, variables, timestamp) => {
    type = type || 'default';
    timestamp = timestamp || new Date();

    

    _eventId += 1;
    if (runId !== lastRunId) {
        lastRunId = runId;
        _eventId = 0; 
    }

    const query1 = 'INSERT INTO events (run_id, type, timestamp) VALUES ($1, $2, $3) RETURNING event_id;';
    const res = await dbClient.query(query1, [runId, type, timestamp]);

    if(type === 'checkpointReached') {
        computeBeats(runId);
        updateEvents();
    }

    // Store each variable
    for (const entry of Object.entries(variables)) {
        var name = entry[0];
        var arg = entry[1];
        var value;
        var diff;
        if(arg === undefined) continue;
        if(arg.value !== undefined) {
            value = arg.value;
            if(arg.diff !== undefined) {
                diff = arg.diff;
            }
        }
        else {
            value = arg;
            diff = 0;
        }

        await storeSingleVariable(name, value, diff);
    }

    return _eventId;
}

// Function to store variables
async function storeSingleVariable(name, value, diff) {
    const query3 = 'INSERT INTO variable_changes (event_id, name_and_path, new_value, diff) VALUES ($1, $2, $3, $4)';
    await dbClient.query(query3, [_eventId, name, value, diff]);
}

// Function to retrieve variables by name
async function getVariablesByName(runid, name) {
    const query = `SELECT value, timestamp FROM variables WHERE name = $1 AND run_id = $2
     ORDER BY timestamp`;
    const res = await dbClient.query(query, [name, runid]);
    return res.rows;
}

async function getNumberOfEventsPerBeat(runId) {
    runId = runId || lastRunId;
    const query = `SELECT beat_id, COUNT(*) AS event_count
                   FROM events
                   WHERE run_id = (SELECT MAX(run_id) FROM events)
                   GROUP BY beat_id`;
    var res = await dbClient.query(query);
    return res;
}


export { setupDatabase, storeEvent, getVariablesByName, createRun, computeBeats, getNumberOfEventsPerBeat };
