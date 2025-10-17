-- =====================================================
-- Create Backup Directory Object for RMAN Simulation
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;

BEGIN
    EXECUTE IMMEDIATE 'CREATE OR REPLACE DIRECTORY db_backups AS ''/opt/oracle/backups''';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -955 THEN RAISE; END IF; -- Ignore "already exists"
END;
/

GRANT READ, WRITE ON DIRECTORY db_backups TO sys, system;
PROMPT Backup directory created successfully.

