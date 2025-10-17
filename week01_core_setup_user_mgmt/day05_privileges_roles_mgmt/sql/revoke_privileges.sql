-- =====================================================
-- Revoke privileges (if needed)
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;

REVOKE app_readonly FROM app_user;
REVOKE app_devops FROM app_dev;

REVOKE SELECT ON hr.employees FROM app_readonly;
REVOKE ALL ON hr.employees FROM app_devops;

PROMPT Privileges revoked successfully.

EXIT;
