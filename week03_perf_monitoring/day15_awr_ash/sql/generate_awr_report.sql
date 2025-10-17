-- ===========================================================
-- Generate AWR Report (HTML)
-- ===========================================================
DEFINE dbid = (SELECT DBID FROM V$DATABASE);
DEFINE inst_num = (SELECT INSTANCE_NUMBER FROM V$INSTANCE);
DEFINE begin_snap = &1;
DEFINE end_snap = &2;
DEFINE report_name = &3;

SPOOL &report_name
SELECT output 
FROM TABLE(DBMS_WORKLOAD_REPOSITORY.AWR_REPORT_HTML(&dbid, &inst_num, &begin_snap, &end_snap));
SPOOL OFF
EXIT;

