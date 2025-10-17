-- =====================================================
-- Create custom roles for application users
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Drop existing roles if they exist
BEGIN
    EXECUTE IMMEDIATE 'DROP ROLE app_readonly';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -01919 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP ROLE app_devops';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -01919 THEN RAISE; END IF;
END;
/

-- Create roles
CREATE ROLE app_readonly;
CREATE ROLE app_devops;

PROMPT Roles created successfully.

EXIT;
