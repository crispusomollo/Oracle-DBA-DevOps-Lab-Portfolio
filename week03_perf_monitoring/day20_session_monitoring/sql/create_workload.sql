-- ============================================================
-- Create a sample workload for AWR and tuning
-- ============================================================

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE txn_data PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE txn_data AS
SELECT rownum AS id,
       ROUND(DBMS_RANDOM.VALUE(100,5000),2) AS amount,
       TRUNC(SYSDATE - DBMS_RANDOM.VALUE(1,1000)) AS txn_date,
       CASE WHEN MOD(rownum,4)=0 THEN 'EAST'
            WHEN MOD(rownum,4)=1 THEN 'WEST'
            WHEN MOD(rownum,4)=2 THEN 'SOUTH'
            ELSE 'NORTH' END AS region
FROM dual CONNECT BY LEVEL <= 500000;

CREATE INDEX idx_txn_region ON txn_data(region);
CREATE INDEX idx_txn_date ON txn_data(txn_date);
EXEC DBMS_STATS.GATHER_TABLE_STATS(USER, 'TXN_DATA');
EXIT;

