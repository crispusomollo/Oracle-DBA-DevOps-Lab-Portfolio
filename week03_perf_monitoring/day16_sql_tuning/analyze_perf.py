#!/usr/bin/env python3
"""
Analyze and visualize Oracle performance metrics from AWR CSV exports
"""

import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime
import os

OUT_DIR = "output"
os.makedirs(OUT_DIR, exist_ok=True)

# --- Load CSV data ---
top_sqls = pd.read_csv(f"{OUT_DIR}/top_sqls.csv")
sys_metrics = pd.read_csv(f"{OUT_DIR}/system_metrics.csv")
wait_events = pd.read_csv(f"{OUT_DIR}/wait_events.csv")

# --- Plot 1: Top SQL by CPU ---
plt.figure(figsize=(8,5))
plt.barh(top_sqls["SQL_ID"], top_sqls["CPU_SEC"], color="orange")
plt.title("Top 5 SQL by CPU Time")
plt.xlabel("CPU Seconds")
plt.ylabel("SQL_ID")
plt.gca().invert_yaxis()
plt.tight_layout()
plt.savefig(f"{OUT_DIR}/sql_top5.png")
plt.close()

# --- Plot 2: System CPU Trend ---
cpu_data = sys_metrics[sys_metrics["METRIC_NAME"].str.contains("CPU")]
plt.figure(figsize=(8,5))
plt.bar(cpu_data["METRIC_NAME"], cpu_data["AVG_VALUE"])
plt.title("Average CPU Usage Metrics (Last 24h)")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.savefig(f"{OUT_DIR}/cpu_trend.png")
plt.close()

# --- Print summary ---
print("✅ Performance Dashboard Generated!")
print(f"- Top SQLs: {OUT_DIR}/top_sqls.csv")
print(f"- CPU Metrics: {OUT_DIR}/system_metrics.csv")
print(f"- Wait Events: {OUT_DIR}/wait_events.csv")
print(f"- Graphs: {OUT_DIR}/sql_top5.png, {OUT_DIR}/cpu_trend.png")

