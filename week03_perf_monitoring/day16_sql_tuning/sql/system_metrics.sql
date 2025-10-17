-- ==========================================================
-- System-level metrics from AWR
-- ==========================================================
SET MARKUP CSV ON
SPOOL ../output/system_metrics.csv

SELECT metric_name, ROUND(average, 2) AS avg_value, ROUND(maxval, 2) AS max_value
FROM dba_hist_sysmetric_summary
WHERE begin_time > SYSDATE - 1
ORDER BY metric_name;

SPOOL OFF
EXIT;

