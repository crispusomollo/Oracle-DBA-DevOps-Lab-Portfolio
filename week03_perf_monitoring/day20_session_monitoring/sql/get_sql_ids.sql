-- ============================================================
-- Identify high-cost SQL statements from AWR
-- ============================================================
SET LINESIZE 200
SPOOL ../output/top_sql_ids.log
SELECT sql_id, elapsed_time/1000000 AS secs, executions, module
FROM v$sql
WHERE parsing_schema_name NOT IN ('SYS','SYSTEM')
ORDER BY elapsed_time DESC FETCH FIRST 5 ROWS ONLY;
SPOOL OFF
EXIT;

