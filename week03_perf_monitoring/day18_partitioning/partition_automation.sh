#!/bin/bash
# ============================================================
# Automate Oracle partition creation, insertion, and performance test
# ============================================================

DB_CONN="sys/YourSysPassword@//localhost:1521/FREE as sysdba"
OUT_DIR="./output"
mkdir -p $OUT_DIR

echo "=== Partitioning Automation Script Started ==="

# 1. Create partitioned tables
echo "[*] Creating partitioned tables..."
sqlplus -s "$DB_CONN" @sql/create_partitioned_tables.sql

# 2. Insert data
echo "[*] Inserting sample data..."
sqlplus -s "$DB_CONN" @sql/insert_sample_data.sql

# 3. Test performance before partition maintenance
echo "[*] Testing query performance..."
sqlplus -s "$DB_CONN" @sql/query_performance_test.sql

# 4. Add new partitions
echo "[*] Adding new partitions dynamically..."
sqlplus -s "$DB_CONN" @sql/add_partition.sql

# 5. Retest performance
echo "[*] Retesting after adding partitions..."
sqlplus -s "$DB_CONN" @sql/query_performance_test.sql | sed 's/query_performance_before/query_performance_after/' > $OUT_DIR/query_performance_after.log

echo "=== Partitioning Completed ==="
echo "[✓] Logs: $OUT_DIR/query_performance_before.log, $OUT_DIR/query_performance_after.log"

