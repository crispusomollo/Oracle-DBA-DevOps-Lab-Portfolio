CREATE TABLE HR.EMP_SENSITIVE AS SELECT * FROM HR.EMPLOYEES;

BEGIN
  DBMS_REDACT.ADD_POLICY(
    object_schema => 'HR',
    object_name => 'EMP_SENSITIVE',
    policy_name => 'MASK_SALARY',
    expression => '1=1',
    column_name => 'SALARY',
    function_type => DBMS_REDACT.FULL);
END;
/

