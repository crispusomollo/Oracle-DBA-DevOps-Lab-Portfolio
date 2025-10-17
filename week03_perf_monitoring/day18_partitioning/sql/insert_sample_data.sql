-- ============================================================
-- Insert sample data for partition testing
-- ============================================================

BEGIN
  FOR i IN 1..100000 LOOP
    INSERT INTO sales_data_range VALUES (
      i,
      CASE WHEN MOD(i,3)=0 THEN 'EAST' WHEN MOD(i,3)=1 THEN 'WEST' ELSE 'SOUTH' END,
      ADD_MONTHS(DATE '2022-01-01', MOD(i,24)),
      ROUND(DBMS_RANDOM.VALUE(100,5000),2)
    );
  END LOOP;

  FOR i IN 1..100000 LOOP
    INSERT INTO sales_data_list VALUES (
      i,
      CASE WHEN MOD(i,3)=0 THEN 'EAST' WHEN MOD(i,3)=1 THEN 'WEST' ELSE 'SOUTH' END,
      ROUND(DBMS_RANDOM.VALUE(100,5000),2)
    );
  END LOOP;

  FOR i IN 1..100000 LOOP
    INSERT INTO sales_data_hash VALUES (i, ROUND(DBMS_RANDOM.VALUE(100,5000),2));
  END LOOP;
  
  COMMIT;
END;
/
EXIT;

