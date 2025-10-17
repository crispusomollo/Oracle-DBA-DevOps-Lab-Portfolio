#!/usr/bin/env python3
import cx_Oracle
import pandas as pd

dsn = cx_Oracle.makedsn("localhost", 1521, service_name="FREE")
conn = cx_Oracle.connect("sys", "YourSysPassword", dsn, mode=cx_Oracle.SYSDBA)
query = """
SELECT index_name, status, visibility 
FROM user_indexes 
WHERE table_name='SALES_DATA' ORDER BY index_name
"""

df = pd.read_sql(query, conn)
print("\n[✓] Index Verification Results:")
print(df.to_string(index=False))

invalid = df[df["STATUS"] != "VALID"]
if len(invalid):
    print("\n[!] Invalid indexes found:")
    print(invalid)
else:
    print("\n[✓] All indexes are VALID.")

conn.close()

