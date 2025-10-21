#!/bin/bash
# ============================================================
# Automate Oracle index creation, analysis, and maintenance
# ============================================================

DB_CONN="sys/Myles003@//localhost:1539/FREEPDB1 as sysdba"
OUT_DIR="./output"
mkdir -p $OUT_DIR

echo "=== Index Maintenance Script Started ==="

# 1. Create test indexes
echo "[*] Creating test indexes..."
sqlplus -s "$DB_CONN" @sql/create_test_indexes.sql

# 2. Analyze index health before rebuild
echo "[*] Analyzing index health before rebuild..."
sqlplus -s "$DB_CONN" @sql/analyze_index_health.sql

# 3. Rebuild invalid/fragmented indexes
echo "[*] Rebuilding invalid indexes..."
sqlplus -s "$DB_CONN" @sql/rebuild_indexes.sql

# 4. Analyze index health after rebuild
echo "[*] Rechecking index health..."
sqlplus -s "$DB_CONN" @sql/analyze_index_health.sql | sed 's/index_health_before/index_health_after/' > $OUT_DIR/index_health_after.log

echo "=== Index Maintenance Completed ==="
echo "[✓] Logs: $OUT_DIR/index_health_before.log, $OUT_DIR/index_health_after.log"
echo "[✓] Rebuild Summary: $OUT_DIR/rebuild_summary.txt"

