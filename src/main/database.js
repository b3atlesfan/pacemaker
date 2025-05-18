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

    
    const queryDropBeatTimings = `
DROP TABLE IF EXISTS beat_timings_per_run;`;
    await dbClient.query(queryDropBeatTimings);

    await dbClient.query(`
CREATE TABLE IF NOT EXISTS beat_timings_per_run (
  run_id INTEGER NOT NULL,
  beat_id INTEGER NOT NULL,
  time_diff INTERVAL,
  CONSTRAINT unique_run_beat UNIQUE (run_id, beat_id)
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
    const queryCreateRun = 'INSERT INTO runs (timestamp) VALUES (now()::timestamp) RETURNING run_id';
    const res = await dbClient.query(queryCreateRun);
    return res.rows[0].run_id;
}

let lastRunId = 0;
let _eventId = -1;

async function computeBeats(runId) {
    const queryBeat = `
INSERT INTO beats (run_id, beat_id, timestamp)
SELECT run_id, 
       (SELECT COUNT(*) - 1 
        FROM events e2 
        WHERE e2.type = 'checkpointReached' AND e2.run_id = $1) AS beat_id, 
       timestamp
FROM events e
WHERE e.type = 'checkpointReached' AND e.run_id = $1
ORDER BY timestamp DESC
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

    
    if (runId !== lastRunId) {
        lastRunId = runId;
    }

    const query1 = 'INSERT INTO events (run_id, type, timestamp) VALUES ($1, $2, $3) RETURNING event_id;';
    const res = await dbClient.query(query1, [runId, type, timestamp]);
    _eventId = res.rows[0].event_id;

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

/*
DROP TABLE IF EXISTS temp_BV_per_run;
CREATE TEMP TABLE temp_BV_per_run AS
SELECT DISTINCT ON (e.run_id, e.beat_id, vc.name_and_path) e.beat_id, vc.name_and_path, vc.new_value, vc.diff FROM events e JOIN 
(SELECT * FROM variable_changes 
WHERE name_and_path IN (${branchVariables.map(v => `'${v}'`).join(', ')})
) vc 
ON e.event_id=vc.event_id ORDER BY vc.name_and_path, e.run_id DESC, e.beat_id, e.timestamp DESC;

SELECT 
    beat_id, name_and_path,
    new_value, 
    COUNT(*) AS occurrences
FROM temp_BV_per_run
GROUP BY name_and_path, beat_id, new_value
ORDER BY name_and_path, beat_id, occurrences DESC;
*/

function calculateUnionInterestedValues(branchVariables, diffMap) {
    const queries = branchVariables.map((name, i) => {
        const column = diffMap[i] ? 'diff' : 'new_value';
        const isDiff = diffMap[i] ? 'TRUE' : 'FALSE';
        return `SELECT *, ${column} AS interestedVal, 
        ${isDiff} AS isDiff 
        FROM variable_changes WHERE name_and_path = '${name}'`;
    });

    if(branchVariables.length === 0) {
        return `SELECT *, 0 AS interestedVal, FALSE AS isDiff
        FROM variable_changes WHERE FALSE
        `;
    }


    const finalQuery = queries.join(' UNION ');
    return finalQuery;
}

async function getBranches(branchVariables, diffMap, minRunId) {
    if (!branchVariables) {
        branchVariables = ['(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)'];
        diffMap = [1];
    }
    //else {
    //    console.log('branchVariables', branchVariables);
    //}
    if (!diffMap || diffMap.length === 0) {
        // Default diffMap to all 0s
        diffMap = Array(branchVariables.length).fill(0);
    }
    
    var unionInterestedValues = calculateUnionInterestedValues(branchVariables, diffMap);

    const queryBranches1 = `
DROP TABLE IF EXISTS only_beats_with_changes;`;
    await dbClient.query(queryBranches1);
    const queryDropABPR = `
DROP TABLE IF EXISTS all_beats_in_a_run;`;
    await dbClient.query(queryDropABPR);
    const queryDroptemp_joinedWithEmpties = `
DROP TABLE IF EXISTS temp_joinedWithEmpties;`;
    await dbClient.query(queryDroptemp_joinedWithEmpties);
    const queryBranchesAllBeatsPerRun = `
CREATE TEMP TABLE all_beats_in_a_run AS
SELECT DISTINCT ON (e.run_id, e.beat_id) e.run_id, e.beat_id FROM events e WHERE e.run_id > ${minRunId};
`
    await dbClient.query(queryBranchesAllBeatsPerRun);
    const queryBranches2 = `
CREATE TEMP TABLE only_beats_with_changes AS
SELECT * FROM (SELECT DISTINCT ON (e.run_id, e.beat_id, vc.name_and_path) e.run_id,e.beat_id, vc.name_and_path, vc.interestedVal, vc.isDiff 
FROM (
 SELECT * FROM events WHERE run_id > ${minRunId}
) e 
JOIN 
(
${unionInterestedValues}
) vc 
ON e.event_id=vc.event_id ORDER BY vc.name_and_path, e.run_id DESC, e.beat_id, e.timestamp DESC) ORDER BY name_and_path, beat_id, interestedVal;`;
    await dbClient.query(queryBranches2);
    const query_temp_joinedWithEmpties = `
CREATE TEMP TABLE temp_joinedWithEmpties AS
SELECT 
    ab.run_id,
    ab.beat_id,
    COALESCE(ob.name_and_path, 'noBranch') AS name_and_path,
    COALESCE(ob.interestedVal, 0) AS interestedVal,
    COALESCE(ob.isDiff, FALSE) AS isDiff
FROM all_beats_in_a_run ab
LEFT JOIN only_beats_with_changes ob
    ON ab.run_id = ob.run_id AND ab.beat_id = ob.beat_id
ORDER BY name_and_path, ab.run_id DESC, ab.beat_id;`
    await dbClient.query(query_temp_joinedWithEmpties);
    const queryBranches3 = `SELECT 
    beat_id, name_and_path,
    interestedVal, isDiff,array_agg(run_id) AS listOfRunIds,
    COUNT(*) AS occurrences
FROM temp_joinedWithEmpties
GROUP BY name_and_path, beat_id, interestedVal, isDiff
ORDER BY name_and_path, beat_id, occurrences DESC;`;
    const res = await dbClient.query(queryBranches3);
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

async function getTimings(runIdListAsArg, beatColumn) {
    const queryCreateBeatTimings = `
INSERT INTO beat_timings_per_run
SELECT * FROM (
SELECT 
    run_id,
    beat_id,
    timestamp - LAG(timestamp) OVER (PARTITION BY run_id ORDER BY timestamp) AS time_diff
FROM 
    beats
WHERE run_id IN (${runIdListAsArg})
ORDER BY run_id DESC
) WHERE beat_id = ${beatColumn} AND time_diff > interval '0 seconds'
ON CONFLICT (run_id, beat_id)
DO UPDATE SET time_diff = EXCLUDED.time_diff;
    `;
    var res = await dbClient.query(queryCreateBeatTimings);
    return res.rows;
}

async function getAvgBeatIntensity(arg) {
    var string_name_weight = ' ';
    var string_name_useLatest = ' ';
    
    for (const entry of Object.entries(arg.nameAndPath_andWeights)) {
        var nameAndPath = entry[1].name_and_path;
        var weight = entry[1].weight;
        var useDiff = entry[1].useDiff || false;
        string_name_weight += `WHEN '${nameAndPath}' THEN ${weight} `;
        if(arg.devideByTime) {
            nameAndWeightAsArg += ` / NULLIF(EXTRACT(SECONDS FROM time_diff_of_beat), 0) `;
        }
        string_name_useLatest += `WHEN '${nameAndPath}' THEN ${useDiff ? 1 : 0} `;
    }
    const nameAndPathAsArg = arg.nameAndPath_andWeights.map(
        v => `'${v.name_and_path}'`
    ).join(', ');

    const runIdListAsArg = arg.runsList.map(
        v => `${v}`
    ).join(', ');

 //SELECT * FROM variable_changes vc JOIN events e ON vc.event_id = e.event_id

    var timings; 
    await getTimings(runIdListAsArg, arg.beatColumn);

    const queryDropEventChanges_and_timings = `
DROP TABLE IF EXISTS eventChanges_and_timings${arg.beatColumn};`;
    await dbClient.query(queryDropEventChanges_and_timings);

    const queryCreateEventChanges_and_timings = `
CREATE TEMP TABLE eventChanges_and_timings${arg.beatColumn} AS
 SELECT 
 e.*, 
 vc.name_and_path, vc.new_value, vc.diff, 
 CASE name_and_path
   ${string_name_weight}
	ELSE 0
 END as weight,
 CASE name_and_path
    ${string_name_useLatest}
	ELSE 0
 END as useLatest,
 btp.time_diff AS time_diff_of_beat
 FROM variable_changes vc
 JOIN events e ON vc.event_id = e.event_id
 JOIN beat_timings_per_run btp 
 ON e.run_id = btp.run_id AND e.beat_id = btp.beat_id
 WHERE e.run_id IN (${runIdListAsArg})
  AND e.beat_id = ${arg.beatColumn} 
 ORDER BY e.run_id, e.beat_id, vc.name_and_path,timestamp DESC;`;
    await dbClient.query(queryCreateEventChanges_and_timings);

    const queryWeightedSumPerRun = `
SELECT DISTINCT ON (run_id, name_and_path)
    run_id, useLatest,
	time_diff_of_beat,name_and_path,
	new_value * weight * useLatest AS sumOrLatest
  FROM eventChanges_and_timings${arg.beatColumn}
WHERE weight != 0 AND useLatest = 1
UNION ALL
SELECT 
    run_id, useLatest,
	time_diff_of_beat,name_and_path,
	SUM(new_value * weight * (1-useLatest)) AS sumOrLatest
  FROM eventChanges_and_timings${arg.beatColumn}
WHERE weight != 0 AND useLatest = 0
GROUP BY run_id, name_and_path,useLatest, time_diff_of_beat
  `;

    const queryAvgBeatIntensity = `
    WITH weighted_values AS (
${queryWeightedSumPerRun}
)
SELECT AVG(sumorlatest) AS avg_weighted_score
FROM weighted_values GROUP BY name_and_path;`
    const res = await dbClient.query(queryAvgBeatIntensity);
    if (!res.rows[0] || res.rows[0].avg_weighted_score === null) {
        return 0;
    }
    var ms = 0;
    if (timings[0]?.time_diff && Object.keys(timings[0]?.time_diff)?.length == 1) {
        if (Object.keys(timings[0]?.time_diff)?.length == 1) {
            ms = timings[0].time_diff.milliseconds ;
        }
        else {
            console.log(Object.keys(timings[0]?.time_diff)?.length) 
        }
    }
    

    const returnObj = {
        avg_weighted_score: res.rows[0].avg_weighted_score,
        time_diff_ms: ms
    };

    return returnObj;
}


export { setupDatabase, storeEvent, getVariablesByName, createRun, computeBeats, getNumberOfEventsPerBeat, getBranches, getAvgBeatIntensity};
