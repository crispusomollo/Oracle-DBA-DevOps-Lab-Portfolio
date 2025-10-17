-- ============================================================
-- Test RMAN Catalog Connection
-- ============================================================

CONNECT rman/Rman#2025@//localhost:1521/FREEPDB1

SELECT username, created
FROM all_users
WHERE username = 'RMAN';

