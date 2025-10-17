-- ==========================================================
-- Wait events summary
-- ==========================================================
SET MARKUP CSV ON
SPOOL ../output/wait_events.csv

SELECT event_name, total_waits, time_waited_micro/1000000 AS time_waited_sec
FROM dba_hist_system_event
WHERE snap_id > (SELECT MAX(snap_id) - 10 FROM dba_hist_snapshot)
ORDER BY time_waited_micro DESC FETCH FIRST 10 ROWS ONLY;

SPOOL OFF
EXIT;

