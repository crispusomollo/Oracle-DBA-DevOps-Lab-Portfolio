-- ============================================================
-- Rebuild fragmented or invalid indexes
-- ============================================================
SET LINESIZE 200
SPOOL ../output/rebuild_summary.txt

DECLARE
  CURSOR idx_cur IS
    SELECT index_name FROM user_indexes 
    WHERE table_name = 'SALES_DATA' AND status != 'VALID';
BEGIN
  FOR i IN idx_cur LOOP
    EXECUTE IMMEDIATE 'ALTER INDEX ' || i.index_name || ' REBUILD';
    DBMS_OUTPUT.PUT_LINE('Rebuilt index: ' || i.index_name);
  END LOOP;
END;
/
SPOOL OFF
EXIT;

