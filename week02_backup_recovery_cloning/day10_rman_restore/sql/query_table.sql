-- =====================================================
-- Query HR.EMPLOYEES for quick verification
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;
SELECT employee_id, first_name, last_name FROM hr.employees FETCH FIRST 5 ROWS ONLY;

