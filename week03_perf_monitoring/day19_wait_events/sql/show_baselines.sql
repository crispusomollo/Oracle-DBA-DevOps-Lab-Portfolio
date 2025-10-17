-- ============================================================
-- Display captured SQL Plan Baselines
-- ============================================================
SET LINESIZE 200
COLUMN sql_handle FORMAT A20
COLUMN plan_name FORMAT A20
COLUMN enabled FORMAT A8
COLUMN accepted FORMAT A8

SELECT sql_handle, plan_name, enabled, accepted, created
FROM dba_sql_plan_baselines
WHERE sql_text LIKE '%SUM(amount)%';
EXIT;

