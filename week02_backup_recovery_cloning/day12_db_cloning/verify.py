#!/usr/bin/env python3
import cx_Oracle

dsn = cx_Oracle.makedsn("localhost", 1521, service_name="FREEPDB1_CLONE")

def verify_clone():
    print("=== PDB Clone Verification ===")
    try:
        conn = cx_Oracle.connect("hr", "hr", dsn)
        cur = conn.cursor()
        cur.execute("SELECT COUNT(*) FROM employees")
        count = cur.fetchone()[0]
        print(f"[✓] Connected to CLONE PDB. Employees table has {count} rows.")
        conn.close()
    except Exception as e:
        print("[✗] Verification failed:", e)

if __name__ == "__main__":
    verify_clone()

