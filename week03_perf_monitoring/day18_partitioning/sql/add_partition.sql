-- ============================================================
-- Add new partition dynamically
-- ============================================================

ALTER TABLE sales_data_range ADD PARTITION p_2025 VALUES LESS THAN (TO_DATE('2026-01-01','YYYY-MM-DD'));
ALTER TABLE sales_data_list ADD PARTITION p_north VALUES ('NORTH');
COMMIT;
EXIT;

