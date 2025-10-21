#!/bin/bash
# ============================================================
# Real-Time SQL Monitoring Dashboard Script
# ============================================================

DB_CONN="sys/Myles003@//localhost:1539/FREEPDB1 as sysdba"
OUT_DIR="./output"
LOG_DIR="./output/logs"
mkdir -p $OUT_DIR $LOG_DIR

while true; do
  NOW=$(date +"%Y-%m-%d_%H-%M-%S")
  echo "=== SQL Monitoring at $NOW ==="

  # Active sessions snapshot
  sqlplus "$DB_CONN" @monitor_sessions.sql
  cp $OUT_DIR/active_sessions.json $LOG_DIR/active_sessions_$NOW.json

  # Blocking sessions snapshot
  sqlplus "$DB_CONN" @lock_analysis.sql
  cp $OUT_DIR/blocking_sessions.json $LOG_DIR/blocking_sessions_$NOW.json

  # Display in Python dashboard
  python3 dashboard.py

  echo "Sleeping for 60s before next refresh..."
  sleep 60
done

