-- ============================================================
-- Analyze index health: fragmentation, clustering factor
-- ============================================================
SET LINESIZE 200
SET PAGESIZE 200
SPOOL ../output/index_health_before.log

SELECT index_name, blevel, leaf_blocks, distinct_keys, clustering_factor, status, visibility
FROM user_indexes
WHERE table_name = 'SALES_DATA'
ORDER BY index_name;

SPOOL OFF
EXIT;

