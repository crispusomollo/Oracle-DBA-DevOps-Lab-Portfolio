-- Create users and assign temporary tablespace, quota, and password policy
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Create dedicated tablespace for app users
CREATE TABLESPACE app_data DATAFILE 'app_data01.dbf' SIZE 50M AUTOEXTEND ON;

-- Create user accounts
CREATE USER app_user IDENTIFIED BY "StrongP@ss123" DEFAULT TABLESPACE app_data QUOTA UNLIMITED ON app_data;
CREATE USER app_dev IDENTIFIED BY "DevPass@2025" DEFAULT TABLESPACE app_data QUOTA 100M ON app_data;

-- Assign roles
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO app_user;
GRANT CONNECT, RESOURCE TO app_dev;

-- Password expiration policy test
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME 90;

PROMPT User creation and privileges complete.

