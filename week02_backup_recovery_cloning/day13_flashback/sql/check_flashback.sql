-- =========================================================
-- Verify Flashback Configuration
-- =========================================================
COL FLASHBACK_ON FOR A10
COL RETENTION_TARGET FOR A10
SELECT FLASHBACK_ON FROM V$DATABASE;
SHOW PARAMETER recovery;

EXIT;

