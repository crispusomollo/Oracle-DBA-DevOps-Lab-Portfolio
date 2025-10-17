-- ============================================================
-- Capture SQL Plan Baseline for query stability
-- ============================================================

DECLARE
  sql_text CLOB := q'[
    SELECT SUM(amount)
    FROM customer_orders
    WHERE region = 'EAST'
    AND order_date BETWEEN DATE '2023-01-01' AND DATE '2023-12-31'
  ]';
  plan_name VARCHAR2(30);
BEGIN
  plan_name := DBMS_SPM.LOAD_PLANS_FROM_CURSOR_CACHE(
    sql_id => (SELECT sql_id FROM v$sql WHERE sql_text LIKE '%SUM(amount)%' AND ROWNUM=1)
  );
  DBMS_OUTPUT.PUT_LINE('Plan captured: ' || plan_name);
END;
/
EXIT;

