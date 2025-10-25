#!/bin/bash
echo "[*] Running automation for Day 35 ..."
# TODO: Add SQL or Bash commands

# check_patches.sh
$ORACLE_HOME/OPatch/opatch lsinventory | grep "Patch"

# apply_patch.sh
PATCH_DIR="/opt/oracle/patches"
cd $PATCH_DIR
$ORACLE_HOME/OPatch/opatch apply -silent
$ORACLE_HOME/OPatch/opatch lsinventory | tee /u01/logs/patch_log.txt

