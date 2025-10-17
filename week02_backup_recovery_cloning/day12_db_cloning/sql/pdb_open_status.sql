-- =====================================================
-- Check if specific PDB is open
-- =====================================================
SET LINES 200
COL NAME FOR A30
SELECT NAME, OPEN_MODE FROM v$pdbs WHERE NAME LIKE '%CLONE%';

