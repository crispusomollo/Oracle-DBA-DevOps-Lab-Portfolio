-- =========================================================
-- Check RMAN catalog for recent backups
-- =========================================================
COL COMPLETION_TIME FOR A30
SELECT DB_NAME, COMPLETION_TIME, INPUT_TYPE, STATUS
FROM V$BACKUP_SET_DETAILS
ORDER BY COMPLETION_TIME DESC;

