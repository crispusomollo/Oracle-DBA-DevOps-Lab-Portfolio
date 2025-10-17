#!/usr/bin/env python3
import time, cx_Oracle, pandas as pd

dsn = cx_Oracle.makedsn("localhost", 1521, service_name="FREE")
conn = cx_Oracle.connect("sys", "YourSysPassword", dsn, mode=cx_Oracle.SYSDBA)
cur = conn.cursor()

queries = [
    ("Range Partition", "SELECT COUNT(*) FROM sales_data_range WHERE sale_date BETWEEN DATE '2023-01-01' AND DATE '2023-12-31'"),
    ("List Partition", "SELECT COUNT(*) FROM sales_data_list WHERE region='EAST'"),
    ("Hash Partition", "SELECT SUM(amount) FROM sales_data_hash WHERE sale_id < 50000")
]

results = []
for name, sql in queries:
    start = time.time()
    cur.execute(sql)
    cur.fetchall()
    end = time.time()
    results.append((name, round(end-start, 4)))

df = pd.DataFrame(results, columns=["Partition Type", "Query Time (s)"])
print("\n[✓] Partition Performance Comparison:\n")
print(df.to_string(index=False))
conn.close()

