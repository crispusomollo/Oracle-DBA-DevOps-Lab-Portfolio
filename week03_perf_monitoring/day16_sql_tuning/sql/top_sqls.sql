-- ==========================================================
-- Top 5 SQL by CPU Time
-- ==========================================================
SET MARKUP CSV ON
SPOOL ../output/top_sqls.csv

SELECT *
FROM (
  SELECT sql_id,
         ROUND(SUM(cpu_time_delta)/1000000, 2) AS cpu_sec,
         ROUND(SUM(elapsed_time_delta)/1000000, 2) AS elapsed_sec,
         SUM(buffer_gets_delta) AS buffer_gets,
         SUM(executions_delta) AS execs
  FROM dba_hist_sqlstat
  WHERE snap_id > (SELECT MAX(snap_id) - 10 FROM dba_hist_snapshot)
  GROUP BY sql_id
  ORDER BY cpu_sec DESC
)
WHERE ROWNUM <= 5;

SPOOL OFF
EXIT;

