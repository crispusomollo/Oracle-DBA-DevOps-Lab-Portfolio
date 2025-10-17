-- ============================================================
-- Generate workload for AWR snapshots
-- ============================================================
SET TIMING ON
BEGIN
  FOR i IN 1..10 LOOP
    EXECUTE IMMEDIATE '
      SELECT region, SUM(amount)
      FROM txn_data
      WHERE txn_date > SYSDATE - ' || i || '
      GROUP BY region';
  END LOOP;
END;
/
EXIT;

