-- =====================================================
-- Simple HR schema test query
-- =====================================================
ALTER SESSION SET CONTAINER = XEPDB1;
SELECT department_name, COUNT(*) AS employees
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY department_name;

