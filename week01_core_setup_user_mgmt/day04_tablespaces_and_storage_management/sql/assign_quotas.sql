-- Assign quotas to users
ALTER SESSION SET CONTAINER = FREEPDB1;

ALTER USER app_user QUOTA 200M ON app_data;
ALTER USER app_dev QUOTA 500M ON app_data;

PROMPT User quotas assigned successfully.

