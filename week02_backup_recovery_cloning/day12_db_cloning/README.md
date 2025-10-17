# Day 12 – Automated PDB Cloning & Snapshot Management

## 🎯 Objective

Automate PDB cloning and snapshot management for faster testing, rollback, and environment provisioning.

---

## ⚙️ Steps

1. Run `clone_pdb.sh` to clone FREEPDB1 → FREEPDB1_CLONE.
2. Run `snapshot_manage.sh` to create (and optionally rollback) snapshots.
3. Run `verify_clone.py` to test the cloned environment.

---

## 📂 Files

| File | Description |
|------|--------------|
| `clone_pdb.sh` | Automates PDB cloning |
| `snapshot_manage.sh` | Automates snapshot creation & rollback |
| `verify_clone.py` | Verifies cloned PDB connectivity |
| `list_pdbs.sql` | Lists all PDBs |
| `snapshot_info.sql` | Displays snapshot details |

---

## ✅ Expected Output

- New PDB `FREEPDB1_CLONE` is created and open in READ WRITE mode  
- Snapshot successfully created for the cloned PDB  
- Verification confirms HR schema data accessible in clone  

---

## 🧠 Notes

- Snapshots allow rollback to a stable point — useful for patch testing  
- You can automate periodic snapshot creation with cron  
- Combine this with RMAN for full physical + logical restore coverage  
- For DevOps pipelines, integrate into Ansible or GitHub Actions for auto environment refresh

