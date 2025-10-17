-- ============================================================
-- Create test indexes (B-tree, bitmap, invisible)
-- ============================================================

-- Create sample table if not exists
BEGIN
  EXECUTE IMMEDIATE 'CREATE TABLE sales_data AS SELECT * FROM all_objects';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Create B-tree index
CREATE INDEX sales_obj_name_idx ON sales_data(object_name);

-- Create bitmap index (useful for low-cardinality columns)
CREATE BITMAP INDEX sales_obj_type_bmp_idx ON sales_data(object_type);

-- Create invisible index (for testing without optimizer usage)
CREATE INDEX sales_temp_invisible_idx ON sales_data(object_id) INVISIBLE;

COMMIT;
EXIT;

