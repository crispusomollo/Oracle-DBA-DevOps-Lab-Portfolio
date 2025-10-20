-- =====================================================
-- Drop roles for reset
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;

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

PROMPT Roles dropped successfully.

EXIT;

