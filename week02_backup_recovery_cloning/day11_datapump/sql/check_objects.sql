-- =====================================================
-- List number of objects in HR schema
-- =====================================================
SELECT owner, COUNT(*) AS object_count
FROM dba_objects
WHERE owner = 'HR'
GROUP BY owner;

