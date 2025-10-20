#!/usr/bin/env python3
import cx_Oracle
import json
import os

dsn = cx_Oracle.makedsn("localhost", 1539, service_name="FREEPDB1")

def verify_backup():
    try:
        conn = cx_Oracle.connect("chrisorigi", "Myles003", dsn, mode=cx_Oracle.SYSDBA)
        cur = conn.cursor()

        print("=== Backup Registry Status ===")
        cur.execute("""
            SELECT backup_name, backup_type, status, start_time, end_time
            FROM sys.backup_registry
            ORDER BY start_time DESC FETCH FIRST 3 ROWS ONLY
        """)

        rows = cur.fetchall()
        for row in rows:
            print(f"[✓] {row[0]} | {row[1]} | {row[2]} | {row[3]} → {row[4]}")

        # Verify manifest file
        manifest_path = "./output/backup_manifest.json"
        if os.path.exists(manifest_path):
            with open(manifest_path) as mf:
                manifest = json.load(mf)
                print("\n=== Backup Manifest ===")
                for k, v in manifest.items():
                    print(f"{k}: {v}")
        else:
            print("[✗] No backup manifest found!")

        cur.close()
        conn.close()
    except Exception as e:
        print("[Error]", e)

if __name__ == "__main__":
    verify_backup()

