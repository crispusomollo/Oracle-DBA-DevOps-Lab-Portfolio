-- ============================================================
-- Compare query times between partitioned tables
-- ============================================================

SET TIMING ON
SET AUTOTRACE ON STAT
SPOOL ../output/query_performance_before.log

SELECT COUNT(*) FROM sales_data_range WHERE sale_date BETWEEN DATE '2023-01-01' AND DATE '2023-12-31';
SELECT COUNT(*) FROM sales_data_list WHERE region = 'EAST';
SELECT SUM(amount) FROM sales_data_hash WHERE sale_id < 50000;

SPOOL OFF
EXIT;

