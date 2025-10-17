-- Disable audit policies (used for testing or reset)
ALTER SESSION SET CONTAINER = FREEPDB1;

NOAUDIT POLICY app_login_audit;
NOAUDIT POLICY app_obj_access_audit;

PROMPT Audit policies disabled.

