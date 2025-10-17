-- =====================================================
-- Check Backup Registry for Status
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;

SELECT backup_name, backup_type, status, start_time, end_time
FROM sys.backup_registry
ORDER BY start_time DESC;

