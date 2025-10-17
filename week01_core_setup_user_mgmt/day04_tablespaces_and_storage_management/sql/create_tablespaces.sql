-- =====================================================
-- Create and manage application tablespaces
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Create data tablespace
CREATE TABLESPACE app_data 
DATAFILE 'app_data01.dbf' SIZE 100M 
AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;

-- Create index tablespace
CREATE TABLESPACE app_index 
DATAFILE 'app_index01.dbf' SIZE 50M 
AUTOEXTEND ON NEXT 5M MAXSIZE 500M;

-- Assign default tablespace to users
ALTER USER app_user DEFAULT TABLESPACE app_data;
ALTER USER app_dev DEFAULT TABLESPACE app_data;

PROMPT Tablespaces created and assigned successfully.

