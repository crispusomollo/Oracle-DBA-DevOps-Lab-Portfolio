-- Resize existing tablespace
ALTER SESSION SET CONTAINER = FREEPDB1;

ALTER DATABASE DATAFILE 'app_data01.dbf' RESIZE 200M;

PROMPT Tablespace resized successfully.

