#!/usr/bin/env python3
import os

print("=== Validating RMAN Environment ===")

checks = {
    "ORACLE_HOME": os.environ.get("ORACLE_HOME"),
    "ORACLE_SID": os.environ.get("ORACLE_SID"),
    "Backup Directory": "/opt/oracle/backups",
    "Archive Directory": "/opt/oracle/archivelog"
}

for key, val in checks.items():
    if val and (os.path.exists(val) or val.startswith("/opt/oracle")):
        print(f"[✓] {key}: {val}")
    else:
        print(f"[✗] {key} missing or invalid")

print("\nRun RMAN command test:")
print("rman target / catalog rman/Rman2025@FREEPDB1")

