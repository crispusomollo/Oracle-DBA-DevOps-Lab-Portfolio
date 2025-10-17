-- ============================================================
-- Create partitioned tables (Range, List, Hash)
-- ============================================================

-- Drop if exists
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE sales_data_range PURGE';
  EXECUTE IMMEDIATE 'DROP TABLE sales_data_list PURGE';
  EXECUTE IMMEDIATE 'DROP TABLE sales_data_hash PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Range partition
CREATE TABLE sales_data_range (
    sale_id NUMBER,
    region VARCHAR2(30),
    sale_date DATE,
    amount NUMBER
)
PARTITION BY RANGE (sale_date) (
    PARTITION p_2022 VALUES LESS THAN (TO_DATE('2023-01-01', 'YYYY-MM-DD')),
    PARTITION p_2023 VALUES LESS THAN (TO_DATE('2024-01-01', 'YYYY-MM-DD')),
    PARTITION p_future VALUES LESS THAN (MAXVALUE)
);

-- List partition
CREATE TABLE sales_data_list (
    sale_id NUMBER,
    region VARCHAR2(30),
    amount NUMBER
)
PARTITION BY LIST (region) (
    PARTITION p_east VALUES ('EAST'),
    PARTITION p_west VALUES ('WEST'),
    PARTITION p_south VALUES ('SOUTH'),
    PARTITION p_others VALUES (DEFAULT)
);

-- Hash partition
CREATE TABLE sales_data_hash (
    sale_id NUMBER,
    amount NUMBER
)
PARTITION BY HASH (sale_id)
PARTITIONS 4;

COMMIT;
EXIT;

