SELECT * FROM events   
ORDER BY timestamp DESC;
SELECT * FROM variable_changes  
ORDER BY variable_change_id DESC;
SELECT * FROM beats ORDER BY run_id DESC;
SELECT * FROM runs ORDER BY run_id DESC;
DROP TABLE changeJoinEvents;
CREATE TEMP TABLE changeJoinEvents AS SELECT e.run_id, e.beat_id, e.type, e.timestamp, vc.* FROM events e JOIN variable_changes vc ON e.event_id = vc.event_id;
SELECT * FROM changeJoinEvents
WHERE run_id > 46
-- AND name_and_path = '(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)'
--AND name_and_path = '(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)' 
ORDER BY variable_change_id DESC;
SELECT * FROM variable_changes WHERE name_and_path='(score, Statics/Score)';

SELECT * FROM only_beats_with_changes;
SELECT *
FROM (
 SELECT * FROM events WHERE run_id > 28
) e 
JOIN 
(
 SELECT *, new_value AS interestedVal, 
        FALSE AS isDiff 
        FROM variable_changes  WHERE FALSE
) vc 
ON e.event_id=vc.event_id ORDER BY vc.name_and_path, e.run_id DESC, e.beat_id, e.timestamp DESC;
SELECT * FROM beat_timings_per_run;
SELECT * FROM eventChanges_and_timings;
DROP TABLE eventChanges_and_timings;
CREATE TEMP TABLE eventChanges_and_timings AS
 SELECT 
 e.*, 
 vc.name_and_path, vc.new_value, vc.diff, 
 CASE name_and_path
 	WHEN '(score, Statics/Score)' THEN 1
 	WHEN '(killcounter, Statics/Enemy)' THEN 0
	WHEN '(health, Statics/HealthSystem)' THEN 1
	ELSE 0
 END as weight,
 CASE name_and_path
 	WHEN '(score, Statics/Score)' THEN 1
 	WHEN '(killcounter, Statics/Enemy)' THEN 0
	WHEN '(health, Statics/HealthSystem)' THEN 0
	ELSE 0
 END as useLatest,
 btp.time_diff AS time_diff_of_beat
 FROM variable_changes vc
 JOIN events e ON vc.event_id = e.event_id
 JOIN beat_timings_per_run btp 
 ON e.run_id = btp.run_id AND e.beat_id = btp.beat_id
 WHERE e.run_id > 26
 ORDER BY e.run_id, e.beat_id, vc.name_and_path,timestamp DESC;

 SELECT * FROM eventChanges_and_timings WHERE name_and_path='(score, Statics/Score)';

SELECT * FROM eventChanges_and_timings;

SELECT DISTINCT ON (run_id, beat_id, name_and_path)
    run_id, useLatest, beat_id,
	time_diff_of_beat,name_and_path,
	new_value * weight * useLatest AS sumOrLatest
  FROM eventChanges_and_timings
  WHERE new_value * weight * useLatest != 0;

DROP TABLE sum_per_run;
CREATE TEMP TABLE sum_per_run AS;
SELECT DISTINCT ON (run_id, name_and_path)
    run_id, useLatest,
	time_diff_of_beat,name_and_path,
	new_value * weight * useLatest AS sumOrLatest
  FROM eventChanges_and_timings
WHERE weight != 0 AND useLatest = 1
UNION ALL;
SELECT 
    run_id, useLatest,
	time_diff_of_beat,name_and_path,
	SUM(new_value * weight * useLatest) AS sumOrLatest
  FROM eventChanges_and_timings
WHERE weight != 0 AND useLatest = 1
GROUP BY run_id, name_and_path,useLatest, time_diff_of_beat;

SELECT * FROM sum_per_run;

WITH weighted_values AS (
SELECT * FROM sum_per_run)
SELECT AVG(sumorlatest) AS avg_weighted_score
FROM weighted_values GROUP BY name_and_path;


WITH latest_values AS (
  SELECT DISTINCT ON (name_and_path)
    name_and_path,
    new_value,
    timestamp
  FROM eventChanges_and_timings
  WHERE name_and_path IN ('(score, Statics/Score)', '(otherName)')
  ORDER BY name_and_path, timestamp DESC
),
weighted_scores AS (
  SELECT
    name_and_path,
    CASE
      WHEN name_and_path = '(score, Statics/Score)' THEN new_value * 3
      WHEN name_and_path = '(otherName)' THEN SUM (new_value * 14
      ELSE 0
    END AS weighted_score
  FROM latest_values
)
SELECT
  e.run_id,
  e.beat_id,
  e.time_diff_of_beat,
  ws.weighted_score
FROM eventChanges_and_timings e
LEFT JOIN weighted_scores ws ON e.name_and_path = ws.name_and_path
WHERE e.name_and_path = '(score, Statics/Score)' 
GROUP BY e.run_id, e.beat_id, e.time_diff_of_beat, ws.weighted_score;



SELECT new_value * 3 FROM eventChanges_and_timings WHERE name_and_path='(score, Statics/Score)'
ORDER BY timestamp desc
LIMIT 1;

SELECT
    run_id,
    beat_id, 
	SUM (CASE name_and_path WHEN '(score, Statics/Score)' THEN 1 * new_value ELSE 0 END) AS weighted_sum
  FROM (
SELECT 
 vc.*, 
 e.*, 
 btp.time_diff AS time_diff_of_beat
 FROM variable_changes vc
 JOIN events e ON vc.event_id = e.event_id
 JOIN beat_timings_per_run btp 
 ON e.run_id = btp.run_id AND e.beat_id = btp.beat_id
 )
  WHERE beat_id = 1
    AND run_id IN (
        31
    )
    AND name_and_path IN (
        '(score, Statics/Score)'
    )
  GROUP BY run_id, beat_id;

SELECT * FROM events e JOIN variable_changes vc ON e.event_id = vc.event_id WHERE diff=0 AND e.run_id > 14 ORDER BY timestamp DESC;

SELECT run_id, 
       (SELECT COUNT(*)
        FROM events e2 
        WHERE e2.type = 'checkpointReached' AND e2.run_id = 24) AS beat_id, 
       timestamp, *
FROM events e
WHERE e.type = 'checkpointReached' AND e.run_id = 24 ORDER BY timestamp DESC;

SELECT * FROM (SELECT * FROM variable_changes vc JOIN events e ON vc.event_id = e.event_id)
WHERE beat_id = 3
    AND run_id IN (23, 23)
    AND name_and_path IN (
      '(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)',
      '(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)');

CREATE TABLE IF NOT EXISTS beat_timings_per_run (
  run_id INTEGER NOT NULL,
  beat_id INTEGER NOT NULL,
  time_diff INTERVAL,
  CONSTRAINT unique_run_beat UNIQUE (run_id, beat_id)
);

SELECT * FROM beat_timings_per_run;
INSERT INTO beat_timings_per_run 
SELECT * FROM (
SELECT 
    run_id,
    beat_id,
    timestamp - LAG(timestamp) OVER (PARTITION BY run_id ORDER BY timestamp) AS time_diff
FROM 
    beats
WHERE run_id IN (31, 28, 27) 
ORDER BY run_id DESC
) WHERE beat_id = 2 AND time_diff > interval '0 seconds'
ON CONFLICT (run_id, beat_id)
DO UPDATE SET time_diff = EXCLUDED.time_diff;

SELECT * FROM beat_timings_per_run;

SELECT 
 vc.*, 
 e.*, 
 btp.time_diff
 FROM variable_changes vc
 JOIN events e ON vc.event_id = e.event_id
 JOIN beat_timings_per_run btp 
 ON e.run_id = btp.run_id AND e.beat_id = btp.beat_id;

WITH weighted_values AS (
  SELECT
    run_id,
    beat_id,
    SUM(
      CASE name_and_path
        WHEN '(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)' THEN 1 * new_value
        WHEN '(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)' THEN 5 * new_value
        ELSE 0
      END
    ) AS weighted_sum
  FROM (SELECT * FROM variable_changes vc JOIN events e ON vc.event_id = e.event_id)
  WHERE beat_id = 3
    AND run_id IN (23, 22)
    AND name_and_path IN (
      '(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)',
      '(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)'
    )
  GROUP BY run_id, beat_id
)
SELECT AVG(weighted_sum) AS avg_weighted_score
FROM weighted_values;


SELECT * FROM (SELECT DISTINCT ON (e.run_id, e.beat_id, vc.name_and_path) e.run_id,e.beat_id, vc.name_and_path, vc.interestedVal, vc.isDiff 
FROM (
 SELECT * FROM events WHERE run_id > 21
) e 
JOIN 
(
SELECT *, new_value AS interestedVal, 
        FALSE AS isDiff 
        FROM variable_changes WHERE name_and_path = '(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)'
) vc 
ON e.event_id=vc.event_id ORDER BY vc.name_and_path, e.run_id DESC, e.beat_id, e.timestamp DESC) ORDER BY name_and_path, beat_id, interestedVal;

CREATE TEMP TABLE all_beats_in_a_run AS;
SELECT DISTINCT ON (e.run_id, e.beat_id) e.run_id, e.beat_id FROM events e WHERE e.run_id > 39;

DROP TABLE only_beats_with_changes;
CREATE TEMP TABLE only_beats_with_changes AS
SELECT e.run_id,e.beat_id, vc.name_and_path, vc.interestedVal, vc.isDiff, e.event_id
FROM (
 SELECT * FROM events WHERE run_id > 39
) e 
JOIN 
(
SELECT *, diff AS interestedVal, 
        FALSE AS isDiff 
        FROM variable_changes WHERE name_and_path = '(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)'
) vc 
ON e.event_id=vc.event_id ORDER BY vc.name_and_path, e.run_id DESC, e.beat_id, e.timestamp DESC;

CREATE TEMP TABLE temp_joinedWithEmpties AS;
SELECT 
    ab.run_id,
    ab.beat_id,
    COALESCE(ob.name_and_path, '(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)') AS name_and_path,
    COALESCE(ob.interestedVal, null ) AS interestedVal,
    COALESCE(ob.isDiff, FALSE) AS isDiff
FROM all_beats_in_a_run ab
LEFT JOIN only_beats_with_changes ob
    ON ab.run_id = ob.run_id AND ab.beat_id = ob.beat_id
ORDER BY name_and_path, ab.run_id DESC, ab.beat_id;
SELECT * FROM temp_joinedWithEmpties;

CREATE TEMP TABLE temp_joined_notnull AS;
SELECT 
    t1.run_id,
    t1.beat_id,
    t1.name_and_path,
    (
        SELECT t2.interestedVal
        FROM temp_joinedWithEmpties t2
        WHERE t2.run_id = t1.run_id
          AND (t2.beat_id <= t1.beat_id OR t1.beat_id IS NULL)
          AND t2.interestedVal IS NOT NULL
        ORDER BY t2.beat_id DESC
        LIMIT 1
    ) AS interestedVal,
    t1.isDiff
FROM temp_joinedWithEmpties t1
ORDER BY t1.name_and_path, t1.run_id DESC, t1.beat_id;

DROP TABLE eventChanges_and_timingsid_bc2_rl44_42_41;
CREATE TEMP TABLE eventChanges_and_timingsid_bc2_rl44_42_41 AS;
 SELECT 
 e.*, 
 vc.name_and_path, vc.new_value, vc.diff, 
 CASE name_and_path
    WHEN '(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)' THEN 1 
	ELSE 0
 END as weight,
 CASE name_and_path
     WHEN '(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)' THEN 1 
	ELSE 0
 END as useLatest,
 btp.time_diff AS time_diff_of_beat
 FROM variable_changes vc
 JOIN events e ON vc.event_id = e.event_id
 JOIN beat_timings_per_run btp 
 ON e.run_id = btp.run_id AND e.beat_id = btp.beat_id
 WHERE e.run_id IN (44, 42, 41)
 ORDER BY e.run_id DESC, e.beat_id DESC, vc.name_and_path,timestamp DESC
 ;
 SELECT * FROM eventChanges_and_timingsid_bc2_rl44_42_41
 WHERE WEIGHT > 0;

 SELECT DISTINCT ON (beat_id) beat_id, AVG(time_diff_of_beat) FROM eventChanges_and_timingsid_bc2_rl44_42_41
 WHERE beat_id = 2
 GROUP BY beat_id
 ;
 SELECT DISTINCT ON (run_id, beat_id) run_id, beat_id, time_diff_of_beat FROM eventChanges_and_timingsid_bc2_rl44_42_41;

 ;

 SELECT DISTINCT ON (run_id, name_and_path)
    run_id, useLatest,
	time_diff_of_beat,name_and_path,
	new_value * weight * useLatest AS sumOrLatest
  FROM eventChanges_and_timingsid_bc2_rl44_42_41
WHERE weight != 0 AND useLatest = 1;

SELECT 
    beat_id, name_and_path,
    interestedVal, isDiff,array_agg(run_id) AS listOfRunIds,
    COUNT(*) AS occurrences
FROM temp_joined_notnull
GROUP BY name_and_path, beat_id, interestedVal, isDiff
ORDER BY beat_id,name_and_path, occurrences DESC;


SELECT *, diff AS interestedVal, 
        FALSE AS isDiff 
        FROM variable_changes WHERE name_and_path = '(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)'
		AND event_id > 304;

SELECT *, diff AS interestedVal, 
        FALSE AS isDiff 
        FROM variable_changes;

SELECT *, diff AS interestedVal, 
        TRUE AS isDiff 
        FROM variable_changes WHERE name_and_path = '(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)';

SELECT *, diff AS interestedVal FROM variable_changes 
WHERE name_and_path IN('(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)','index');

SELECT *, 
diff AS interestedVal,
name_and_path || '_diff' AS NAP_modified
FROM variable_changes WHERE name_and_path = 'index'
UNION
SELECT *, new_value AS interestedVal,
name_and_path || '' AS NAP_modified FROM variable_changes WHERE name_and_path = '(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)';

DROP TABLE IF EXISTS temp_BV_per_run;
CREATE TEMP TABLE temp_BV_per_run AS
SELECT * FROM (
SELECT DISTINCT ON (e.run_id, e.beat_id, vc.name_and_path) e.run_id,e.beat_id, vc.name_and_path, vc.interestedVal 
FROM events e 
WHERE e.run_id > 4
JOIN 
(SELECT *, diff AS interestedVal FROM variable_changes 
WHERE name_and_path IN('(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)','index')
) vc 
ON e.event_id=vc.event_id ORDER BY vc.name_and_path, e.run_id DESC, e.beat_id, e.timestamp DESC) ORDER BY name_and_path, beat_id, interestedVal;
SELECT * FROM temp_BV_per_run;
INSERT INTO temp_BV_per_run VALUES (2, 'index', 2, 12)

CREATE TEMP TABLE temp_branches AS;
SELECT 
    beat_id, name_and_path,array_agg(run_id) AS listOfRunIds,
    interestedVal, 
    COUNT(*) AS occurrences
FROM temp_BV_per_run
GROUP BY name_and_path, beat_id, interestedVal
ORDER BY name_and_path, beat_id, occurrences DESC;
SELECT * FROM temp_branches;

SELECT beat_id, name_and_path, new_value, COUNT(*) AS occurrences
                   FROM variable_changes
                   WHERE name_and_path IN (
'(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)', 'index')
                   GROUP BY name_and_path, beat_id, new_value
                   ORDER BY name_and_path, beat_id, occurrences DESC;


SELECT DISTINCT ON (e.run_id, e.beat_id) *
FROM (
    SELECT * FROM events e2
    WHERE e2.type = 'checkpointReached'
) e
JOIN beats b 
ON e.run_id = b.run_id AND e.beat_id = b.beat_id
ORDER BY e.run_id, e.beat_id, e.timestamp DESC;

SELECT DISTINCT ON (e.type, e.run_id, e.beat_id) *
FROM (
    SELECT * FROM events e2
) e
JOIN beats b 
ON e.run_id = b.run_id AND e.beat_id = b.beat_id
ORDER BY e.type, e.run_id, e.beat_id, e.timestamp DESC;

INSERT INTO events (run_id, type, timestamp) VALUES (13, 2, 