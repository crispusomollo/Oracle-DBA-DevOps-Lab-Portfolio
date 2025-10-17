-- =========================================================
-- Enable Flashback Database and configure FRA
-- =========================================================
ALTER SYSTEM SET DB_FLASHBACK_RETENTION_TARGET = 1440;  -- in minutes
ALTER SYSTEM SET DB_RECOVERY_FILE_DEST_SIZE = 10G SCOPE=BOTH;
ALTER SYSTEM SET DB_RECOVERY_FILE_DEST = '/opt/oracle/flash_recovery_area' SCOPE=BOTH;

-- Enable Flashback
SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE FLASHBACK ON;
ALTER DATABASE OPEN;
SHOW PARAMETER recovery;

