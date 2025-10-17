#!/usr/bin/env python3
import cx_Oracle
import sys

dsn = cx_Oracle.makedsn("localhost", 1539, service_name="FREEPDB1")

def verify_tablespaces():
    try:
        conn = cx_Oracle.connect("chrisorigi", "Myles003", dsn, mode=cx_Oracle.SYSDBA)
        cur = conn.cursor()

        print("=== Tablespace Verification ===")

        # List created tablespaces
        cur.execute("""
            SELECT tablespace_name, file_name, bytes/1024/1024 AS size_mb, autoextensible
            FROM dba_data_files
            WHERE tablespace_name IN ('APP_DATA', 'APP_INDEX')
        """)
        for row in cur.fetchall():
            print(f"[✓] {row[0]} | File: {row[1]} | Size: {row[2]:.1f}MB | Autoextend: {row[3]}")

        # Verify quotas
        cur.execute("""
            SELECT username, tablespace_name, bytes/1024/1024 AS quota_mb
            FROM dba_ts_quotas
            WHERE username IN ('APP_USER', 'APP_DEV')
        """)
        print("\n=== User Quotas ===")
        for row in cur.fetchall():
            print(f"[→] {row[0]} | {row[1]} | Quota: {row[2]:.1f}MB")

        cur.close()
        conn.close()
    except Exception as e:
        print("[Error]", e)
        sys.exit(1)

if __name__ == "__main__":
    verify_tablespaces()

