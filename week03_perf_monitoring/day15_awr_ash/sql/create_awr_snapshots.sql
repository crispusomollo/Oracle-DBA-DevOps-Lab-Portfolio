-- ===========================================================
-- Create AWR snapshots manually
-- ===========================================================
EXEC DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT();
SELECT SNAP_ID, BEGIN_INTERVAL_TIME, END_INTERVAL_TIME 
FROM DBA_HIST_SNAPSHOT 
ORDER BY SNAP_ID DESC FETCH FIRST 5 ROWS ONLY;

