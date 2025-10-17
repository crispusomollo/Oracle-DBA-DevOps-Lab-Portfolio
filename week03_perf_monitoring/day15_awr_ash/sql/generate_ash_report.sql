-- ===========================================================
-- Generate ASH Report (HTML)
-- ===========================================================
DEFINE dbid = (SELECT DBID FROM V$DATABASE);
DEFINE inst_num = (SELECT INSTANCE_NUMBER FROM V$INSTANCE);
DEFINE begin_time = SYSDATE - (1/24); -- past 1 hour
DEFINE end_time = SYSDATE;
DEFINE report_name = &1;

SPOOL &report_name
SELECT output 
FROM TABLE(DBMS_WORKLOAD_REPOSITORY.ASH_REPORT_HTML(&dbid, &inst_num, &begin_time, &end_time));
SPOOL OFF
EXIT;

