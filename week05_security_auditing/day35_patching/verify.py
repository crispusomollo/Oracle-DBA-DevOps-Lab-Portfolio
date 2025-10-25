# verify_patch.py
import subprocess
result = subprocess.getoutput("$ORACLE_HOME/OPatch/opatch lsinventory | grep 'Patch'")
with open("/opt/oracle/logs/patch_report.txt", "w") as f:
    f.write(result)
print("Patch verification complete.")

