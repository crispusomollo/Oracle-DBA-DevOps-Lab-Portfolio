-- Connect to the correct PDB
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Enable DBMS_OUTPUT
SET SERVEROUTPUT ON

PROMPT === Starting cleanup of users and tablespace ===

BEGIN
    DBMS_OUTPUT.PUT_LINE('Checking and dropping user APP_USER...');
    EXECUTE IMMEDIATE 'DROP USER app_user CASCADE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -1918 THEN  -- ORA-01918: user does not exist
            DBMS_OUTPUT.PUT_LINE('User APP_USER does not exist. Skipping.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Error dropping user APP_USER: ' || SQLERRM);
            RAISE;
        END IF;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Checking and dropping user APP_DEV...');
    EXECUTE IMMEDIATE 'DROP USER app_dev CASCADE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -1918 THEN  -- ORA-01918: user does not exist
            DBMS_OUTPUT.PUT_LINE('User APP_DEV does not exist. Skipping.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Error dropping user APP_DEV: ' || SQLERRM);
            RAISE;
        END IF;
END;
/

DECLARE
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM dba_tablespaces WHERE tablespace_name = 'APP_DATA';
    
    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Dropping tablespace APP_DATA...');
        EXECUTE IMMEDIATE 'DROP TABLESPACE app_data INCLUDING CONTENTS AND DATAFILES';
        DBMS_OUTPUT.PUT_LINE('Tablespace APP_DATA dropped.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Tablespace APP_DATA does not exist. Skipping.');
    END IF;
END;
/

PROMPT === Cleanup completed ===

