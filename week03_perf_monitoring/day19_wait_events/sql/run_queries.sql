-- ============================================================
-- Run queries with and without optimizer hints
-- ============================================================

SET AUTOTRACE ON
SET TIMING ON
SPOOL ../output/plan_before.log

-- Baseline Query
SELECT SUM(amount)
FROM customer_orders
WHERE region = 'EAST'
AND order_date BETWEEN DATE '2023-01-01' AND DATE '2023-12-31';

SPOOL OFF

-- Optimized Query using HINT
SPOOL ../output/plan_after.log

SELECT /*+ INDEX(customer_orders idx_orders_date) */ SUM(amount)
FROM customer_orders
WHERE region = 'EAST'
AND order_date BETWEEN DATE '2023-01-01' AND DATE '2023-12-31';

SPOOL OFF
EXIT;

