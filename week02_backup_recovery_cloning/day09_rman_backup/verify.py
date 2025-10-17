#!/usr/bin/env python3
import cx_Oracle, json, os

dsn = cx_Oracle.makedsn("localhost", 1521, service_name="FREEPDB1")

def check_backups():
    conn = cx_Oracle.connect("sys", "YourSysPassword", dsn, mode=cx_Oracle.SYSDBA)
    cur = conn.cursor()
    print("=== Recent RMAN Backups ===")
    cur.execute("""
        SELECT backup_type, level_type, status, location, start_time
        FROM sys.rman_backup_registry
        ORDER BY start_time DESC FETCH FIRST 5 ROWS ONLY
    """)
    for row in cur.fetchall():
        print(f"{row[0]} ({row[1]}) - {row[2]} @ {row[4]} -> {row[3]}")

    # Check for JSON manifests
    for f in ["./output/full_manifest.json", "./output/incr_manifest.json"]:
        if os.path.exists(f):
            with open(f) as mf:
                data = json.load(mf)
                print(f"\nManifest: {f}")
                print(json.dumps(data, indent=2))
        else:
            print(f"[✗] Manifest not found: {f}")

    cur.close()
    conn.close()

if __name__ == "__main__":
    check_backups()

