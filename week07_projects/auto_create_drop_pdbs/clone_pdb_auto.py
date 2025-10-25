#!/usr/bin/env python3
# ==============================================================
# Oracle PDB Clone Script (Auto File Mapping)
# Author: Chris Origi
# Usage : python3 clone_pdb_auto.py FREEPDB1 FREEPDB2
# ==============================================================

import cx_Oracle
import os
import sys
import re

# --- Validate args ---
if len(sys.argv) != 3:
    print("Usage: python3 clone_pdb_auto.py <SOURCE_PDB> <CLONE_PDB>")
    sys.exit(1)

SRC_PDB = sys.argv[1].upper()
CLONE_PDB = sys.argv[2].upper()

ORACLE_SID = "FREE"
ORACLE_HOME = "/opt/oracle/product/23ai/dbhomeFree"

os.environ["ORACLE_SID"] = ORACLE_SID
os.environ["ORACLE_HOME"] = ORACLE_HOME
os.environ["PATH"] = f"{ORACLE_HOME}/bin:" + os.environ["PATH"]

CLONE_DIR = f"/opt/oracle/oradata/{ORACLE_SID}/{CLONE_PDB}"
os.makedirs(CLONE_DIR, exist_ok=True)

print(f"✅ Clone directory prepared: {CLONE_DIR}")

try:
    conn = cx_Oracle.connect("/", mode=cx_Oracle.SYSDBA)
    cur = conn.cursor()
    print(f"➡️  Connected as SYSDBA to clone {SRC_PDB} → {CLONE_PDB}")

    # --- Switch to source PDB and get data files ---
    cur.execute(f"ALTER SESSION SET CONTAINER={SRC_PDB}")
    cur.execute("SELECT file_name FROM dba_data_files")
    datafiles = [r[0] for r in cur.fetchall()]

    if not datafiles:
        raise Exception(f"No datafiles found in {SRC_PDB}")

    print(f"📦 Found {len(datafiles)} datafiles in {SRC_PDB}")

    # --- Build FILE_NAME_CONVERT dynamically ---
    convert_pairs = []
    for src_path in datafiles:
        src_dir = os.path.dirname(src_path)
        convert_pairs.append(src_dir)
        convert_pairs.append(CLONE_DIR)
    # Remove duplicates while preserving order
    seen = set()
    unique_pairs = []
    for p in convert_pairs:
        if p not in seen:
            unique_pairs.append(p)
            seen.add(p)

    file_name_convert_clause = "FILE_NAME_CONVERT = (\n  '" + "',\n  '".join(unique_pairs) + "'\n)"

    # --- Go back to CDB$ROOT for clone ---
    cur.execute("ALTER SESSION SET CONTAINER=CDB$ROOT")

    print(f"🧩 FILE_NAME_CONVERT:\n{file_name_convert_clause}\n")

    # --- Prepare and clone ---
    cur.execute(f"ALTER PLUGGABLE DATABASE {SRC_PDB} CLOSE IMMEDIATE")
    cur.execute(f"ALTER PLUGGABLE DATABASE {SRC_PDB} OPEN READ ONLY")

    clone_sql = f"""
        CREATE PLUGGABLE DATABASE {CLONE_PDB}
        FROM {SRC_PDB}
        {file_name_convert_clause}
    """

    print(f"➡️  Cloning {SRC_PDB} → {CLONE_PDB} ...")
    cur.execute(clone_sql)
    print(f"✅ Clone created: {CLONE_PDB}")

    cur.execute(f"ALTER PLUGGABLE DATABASE {CLONE_PDB} OPEN READ WRITE")
    cur.execute(f"ALTER PLUGGABLE DATABASE {CLONE_PDB} SAVE STATE")

    # Reopen source
    cur.execute(f"ALTER PLUGGABLE DATABASE {SRC_PDB} CLOSE IMMEDIATE")
    cur.execute(f"ALTER PLUGGABLE DATABASE {SRC_PDB} OPEN READ WRITE")

    conn.commit()
    print(f"\n🎉 Clone completed successfully: {CLONE_PDB}\n")

    # List PDBs
    cur.execute("SELECT name, open_mode FROM v$pdbs ORDER BY name")
    rows = cur.fetchall()
    print("📋 Current PDBs:")
    for name, mode in rows:
        print(f" - {name:20} {mode}")

except cx_Oracle.DatabaseError as e:
    print(f"❌ Database error: {e}")

finally:
    try:
        cur.close()
        conn.close()
    except Exception:
        pass

