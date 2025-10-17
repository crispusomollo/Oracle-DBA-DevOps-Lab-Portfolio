-- =====================================================
-- List all PDBs with their status
-- =====================================================
SET LINES 150
COL NAME FOR A20
COL OPEN_MODE FOR A15
SELECT NAME, OPEN_MODE FROM v$pdbs ORDER BY NAME;

