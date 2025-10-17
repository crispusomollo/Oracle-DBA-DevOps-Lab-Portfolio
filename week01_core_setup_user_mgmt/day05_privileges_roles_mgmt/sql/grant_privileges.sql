-- =====================================================
-- Grant privileges to roles and assign them to users
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Grant system privileges
GRANT CREATE SESSION TO app_readonly;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE TO app_devops;

-- Grant object privileges
GRANT SELECT ON hr.employees TO app_readonly;
GRANT SELECT, INSERT, UPDATE, DELETE ON hr.employees TO app_devops;

-- Assign roles to users
GRANT app_readonly TO app_user;
GRANT app_devops TO app_dev;

PROMPT Privileges and roles granted successfully.

EXIT;
