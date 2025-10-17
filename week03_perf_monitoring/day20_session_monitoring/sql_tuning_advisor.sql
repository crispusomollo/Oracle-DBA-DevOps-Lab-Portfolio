-- ============================================================
-- Run SQL Tuning Advisor for one SQL ID
-- ============================================================
SET SERVEROUTPUT ON
DECLARE
  l_sql_tune_task VARCHAR2(30);
BEGIN
  l_sql_tune_task := DBMS_SQLTUNE.CREATE_TUNING_TASK(
    sql_id => '&1',
    scope  => DBMS_SQLTUNE.SCOPE_COMPREHENSIVE,
    time_limit => 60,
    task_name => 'sql_tune_task_' || &1,
    description => 'Auto Tuning for SQL ' || &1
  );

  DBMS_SQLTUNE.EXECUTE_TUNING_TASK(l_sql_tune_task);

  DBMS_OUTPUT.PUT_LINE('Task Name: ' || l_sql_tune_task);
  DBMS_OUTPUT.PUT_LINE('Recommendations:');
  DBMS_OUTPUT.PUT_LINE(DBMS_SQLTUNE.REPORT_TUNING_TASK(l_sql_tune_task));
END;
/
EXIT;

