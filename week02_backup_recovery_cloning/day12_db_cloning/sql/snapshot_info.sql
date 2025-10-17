-- =====================================================
-- List all snapshots for a PDB
-- =====================================================
ALTER SESSION SET CONTAINER = XEPDB1;
SELECT SNAPSHOT_NAME, CON_ID, SNAPSHOT_TIME FROM DBA_PDB_SNAPSHOTS ORDER BY SNAPSHOT_TIME DESC;

