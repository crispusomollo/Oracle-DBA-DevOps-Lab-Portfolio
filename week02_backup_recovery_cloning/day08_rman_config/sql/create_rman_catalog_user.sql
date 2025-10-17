-- ============================================================
-- Create RMAN Catalog User (optional but recommended)
-- ============================================================

ALTER SESSION SET CONTAINER = FREEPDB1;

-- Create RMAN catalog user
CREATE USER rman IDENTIFIED BY Rman#2025
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp
  QUOTA UNLIMITED ON users;

-- Grant privileges
GRANT CONNECT, RESOURCE, RECOVERY_CATALOG_OWNER TO rman;

-- Register recovery catalog
BEGIN
  EXECUTE IMMEDIATE 'CREATE CATALOG';
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE = -20101 THEN
    DBMS_OUTPUT.PUT_LINE('Catalog already exists.');
  ELSE
    RAISE;
  END IF;
END;
/

PROMPT RMAN catalog user setup complete.

