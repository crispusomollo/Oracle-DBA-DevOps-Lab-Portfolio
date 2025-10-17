-- ============================================================
-- Drop indexes for cleanup
-- ============================================================
BEGIN
  FOR i IN (SELECT index_name FROM user_indexes WHERE table_name = 'SALES_DATA') LOOP
    EXECUTE IMMEDIATE 'DROP INDEX ' || i.index_name;
  END LOOP;
  EXECUTE IMMEDIATE 'DROP TABLE sales_data PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
EXIT;

