-- ============================================================
-- Create a test table for plan analysis
-- ============================================================

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE customer_orders PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE customer_orders AS
SELECT rownum AS order_id,
       CASE WHEN MOD(rownum,3)=0 THEN 'EAST' WHEN MOD(rownum,3)=1 THEN 'WEST' ELSE 'SOUTH' END AS region,
       TRUNC(DBMS_RANDOM.VALUE(100,5000),2) AS amount,
       ADD_MONTHS(DATE '2022-01-01', MOD(rownum,24)) AS order_date
FROM dual CONNECT BY LEVEL <= 100000;

CREATE INDEX idx_orders_region ON customer_orders(region);
CREATE INDEX idx_orders_date ON customer_orders(order_date);

EXEC DBMS_STATS.GATHER_TABLE_STATS(USER, 'CUSTOMER_ORDERS');
EXIT;

