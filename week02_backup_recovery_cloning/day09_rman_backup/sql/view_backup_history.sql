-- =====================================================
-- View RMAN Backup History
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;

SELECT id, backup_type, level_type, status, location, start_time, end_time
FROM sys.rman_backup_registry
ORDER BY start_time DESC;

