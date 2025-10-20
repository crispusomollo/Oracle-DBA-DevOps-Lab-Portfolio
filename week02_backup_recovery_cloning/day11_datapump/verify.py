#!/usr/bin/env python3
import cx_Oracle

dsn = cx_Oracle.makedsn("localhost", 1539, service_name="FREEPDB1")

def verify_import():
    print("=== Data Pump Import Verification ===")
    try:
        conn = cx_Oracle.connect("chrisorigi", "Myles003", dsn)
        cur = conn.cursor()
        cur.execute("SELECT COUNT(*) FROM employees")
        count = cur.fetchone()[0]
        print(f"[✓] HR_RESTORE.EMPLOYEES table exists with {count} rows")
        conn.close()
    except Exception as e:
        print("[✗] Verification failed:", e)

if __name__ == "__main__":
    verify_import()

