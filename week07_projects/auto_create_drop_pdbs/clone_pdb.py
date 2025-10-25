#!/usr/bin/env python3
# ==============================================================
# Oracle PDB Clone Script (Fixed Multi-Path Version)
# Author: Chris Origi
# Usage : python3 clone_pdb.py FREEPDB1 FREEPDB2
# ==============================================================

import cx_Oracle
import os
import sys

# --- Check arguments ---
if len(sys.argv) != 3:
    print("Usage: python3 clone_pdb.py <SOURCE_PDB> <CLONE_PDB>")
    sys.exit(1)

SRC_PDB = sys.argv[1].upper()
CLONE_PDB = sys.argv[2].upper()

# --- Oracle environment ---
ORACLE_SID = "FREE"
os.environ["ORACLE_SID"] = ORACLE_SID
os.environ["ORACLE_HOME"] = "/opt/oracle/product/23ai/dbhomeFree"
os.environ["PATH"] = f"{os.environ['ORACLE_HOME']}/bin:" + os.environ["PATH"]

SRC_DIR = f"/opt/oracle/oradata/{ORACLE_SID}/{SRC_PDB}"
CLONE_DIR = f"/opt/oracle/oradata/{ORACLE_SID}/{CLONE_PDB}"

# --- Verify source directory ---
if not os.path.exists(SRC_DIR):
    print(f"❌ Source PDB directory not found: {SRC_DIR}")
    sys.exit(1)

os.makedirs(CLONE_DIR, exist_ok=True)
print(f"✅ Clone directory prepared: {CLONE_DIR}")

# --- SQL cloning commands ---
sql_commands = f"""
ALTER SESSION SET CONTAINER = CDB$ROOT;

ALTER PLUGGABLE DATABASE {SRC_PDB} CLOSE IMMEDIATE;
ALTER PLUGGABLE DATABASE {SRC_PDB} OPEN READ ONLY;

CREATE PLUGGABLE DATABASE {CLONE_PDB} FROM {SRC_PDB}
FILE_NAME_CONVERT = (
  '/opt/oracle/oradata/{ORACLE_SID}/{SRC_PDB}/', '/opt/oracle/oradata/{ORACLE_SID}/{CLONE_PDB}/',
  '/opt/oracle/product/23ai/dbhomeFree/dbs/', '/opt/oracle/oradata/{ORACLE_SID}/{CLONE_PDB}/',
  '/opt/oracle/oradata/{ORACLE_SID}/', '/opt/oracle/oradata/{ORACLE_SID}/{CLONE_PDB}/'
);

ALTER PLUGGABLE DATABASE {CLONE_PDB} OPEN READ WRITE;
ALTER PLUGGABLE DATABASE {CLONE_PDB} SAVE STATE;

ALTER PLUGGABLE DATABASE {SRC_PDB} CLOSE IMMEDIATE;
ALTER PLUGGABLE DATABASE {SRC_PDB} OPEN READ WRITE;
"""

# --- Execute the workflow ---
try:
    conn = cx_Oracle.connect("/", mode=cx_Oracle.SYSDBA)
    cur = conn.cursor()
    print(f"➡️  Connecting as SYSDBA to clone {SRC_PDB} → {CLONE_PDB} ...")

    for statement in sql_commands.strip().split(";"):
        stmt = statement.strip()
        if not stmt:
            continue
        try:
            cur.execute(stmt)
            print(f"✅ Executed: {stmt.splitlines()[0]}")
        except cx_Oracle.DatabaseError as e:
            print(f"⚠️  Skipped statement due to: {e}")
            continue

    conn.commit()
    print(f"\n🎉 Clone completed successfully: {CLONE_PDB}\n")

    # Verify current PDBs
    cur.execute("SELECT name, open_mode FROM v$pdbs ORDER BY name")
    rows = cur.fetchall()
    print("📋 Current PDBs:")
    for name, mode in rows:
        print(f" - {name:20} {mode}")

except cx_Oracle.DatabaseError as e:
    print(f"❌ Database error: {e}")
    sys.exit(1)

finally:
    try:
        cur.close()
        conn.close()
    except Exception:
        pass

