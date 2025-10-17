-- Assign custom roles or privileges
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Example custom role
CREATE ROLE app_read_only;
GRANT SELECT ANY TABLE TO app_read_only;

-- Assign role to user
GRANT app_read_only TO app_user;

PROMPT Custom role created and assigned.

