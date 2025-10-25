#!/usr/bin/env python3
# ==============================================================
# Oracle Multi-PDB Drop Script (Enhanced)
# Author  : Chris Origi
# Usage   : python3 drop_pdbs.py FREEPDB1_CLONE FREEPDB2 ...
# ==============================================================

import cx_Oracle
import os
import sys

# --- ANSI color codes ---
GREEN = "\033[92m"
YELLOW = "\033[93m"
RED = "\033[91m"
RESET = "\033[0m"

# --- Validate args ---
if len(sys.argv) < 2:
    print("Usage: python3 drop_pdbs.py <PDB_NAME1> [<PDB_NAME2> ...]")
    sys.exit(1)

PDBS = [p.upper() for p in sys.argv[1:]]

# --- Oracle environment ---
ORACLE_SID = "FREE"
ORACLE_HOME = "/opt/oracle/product/23ai/dbhomeFree"

os.environ["ORACLE_SID"] = ORACLE_SID
os.environ["ORACLE_HOME"] = ORACLE_HOME
os.environ["PATH"] = f"{ORACLE_HOME}/bin:" + os.environ["PATH"]

print(f"\n🧹 {YELLOW}Starting PDB cleanup...{RESET}\n")

# --- Track results ---
dropped = []
not_found = []
failed = []

try:
    conn = cx_Oracle.connect("/", mode=cx_Oracle.SYSDBA)
    cur = conn.cursor()
    cur.execute("ALTER SESSION SET CONTAINER=CDB$ROOT")

    for pdb in PDBS:
        print(f"➡️  {YELLOW}Processing PDB:{RESET} {pdb}")

        # --- Check if PDB exists ---
        cur.execute("SELECT name, open_mode FROM v$pdbs WHERE name=:pdb", {"pdb": pdb})
        row = cur.fetchone()

        if not row:
            print(f"   ⚠️  {YELLOW}{pdb} does not exist — skipping.{RESET}\n")
            not_found.append(pdb)
            continue

        print(f"   ✅ Found: {GREEN}{pdb}{RESET} ({row[1]})")

        # --- Close if open ---
        if row[1] != "MOUNTED":
            try:
                cur.execute(f"ALTER PLUGGABLE DATABASE {pdb} CLOSE IMMEDIATE")
                print(f"   📴 {GREEN}Closed {pdb}{RESET}")
            except cx_Oracle.DatabaseError as e:
                print(f"   ⚠️  {YELLOW}Warning closing {pdb}:{RESET} {e}")

        # --- Drop PDB including datafiles ---
        try:
            cur.execute(f"DROP PLUGGABLE DATABASE {pdb} INCLUDING DATAFILES")
            conn.commit()
            print(f"   🗑️  {GREEN}Dropped {pdb} successfully.{RESET}\n")
            dropped.append(pdb)
        except cx_Oracle.DatabaseError as e:
            print(f"   ❌ {RED}Failed to drop {pdb}:{RESET} {e}\n")
            failed.append(pdb)

    # --- Verification summary ---
    print("\n🧾 === Drop Summary ===")
    if dropped:
        print(f"✅ {GREEN}Dropped:{RESET} {', '.join(dropped)}")
    if not_found:
        print(f"⚠️  {YELLOW}Not Found:{RESET} {', '.join(not_found)}")
    if failed:
        print(f"❌ {RED}Failed:{RESET} {', '.join(failed)}")

    # --- List remaining PDBs ---
    print(f"\n📋 {YELLOW}Remaining PDBs:{RESET}")
    cur.execute("SELECT name, open_mode FROM v$pdbs ORDER BY name")
    for name, mode in cur.fetchall():
        print(f" - {name:20} {mode}")

    print(f"\n🎉 {GREEN}PDB cleanup complete!{RESET}\n")

except cx_Oracle.DatabaseError as e:
    print(f"{RED}❌ Database error:{RESET} {e}")

finally:
    try:
        cur.close()
        conn.close()
    except Exception:
        pass

