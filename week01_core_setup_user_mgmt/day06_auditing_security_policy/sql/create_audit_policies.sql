-- =====================================================
-- Create custom audit policies for app users
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Drop existing policies if they exist
BEGIN
    EXECUTE IMMEDIATE 'DROP AUDIT POLICY app_login_audit';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -46241 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP AUDIT POLICY app_obj_access_audit';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -46241 THEN RAISE; END IF;
END;
/

-- Create custom audit policies
CREATE AUDIT POLICY app_login_audit 
ACTIONS LOGON, LOGOFF;

CREATE AUDIT POLICY app_obj_access_audit 
ACTIONS SELECT, INSERT, UPDATE, DELETE 
ON hr.employees;

-- Enable for specific users
AUDIT POLICY app_login_audit BY app_user, app_dev;
AUDIT POLICY app_obj_access_audit BY app_dev;

PROMPT Custom audit policies created and enabled.

EXIT;
