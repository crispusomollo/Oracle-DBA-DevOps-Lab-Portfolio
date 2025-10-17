## ⚙️ **Step 4 – `devops_init.sh` (Automation Script)**

##   Create the script at root:

cat << 'EOF' > devops_init.sh
#!/bin/bash
# ===========================================================
# Oracle-DBA-DevOps-Lab: Repo Auto Folder Generator
# Author: Chris Origi
# ===========================================================

echo "[*] Initializing new Oracle DBA + DevOps lab structure..."

# Ask for Week & Day
read -p "Enter Week Number (e.g., 01): " WEEK
read -p "Enter Day Number (e.g., 03): " DAY
read -p "Enter Short Description (e.g., user_mgmt): " DESC

# Create folder
FOLDER="week${WEEK}_${DESC}/day${DAY}_lab"
mkdir -p "$FOLDER/output"

# Add placeholders
echo "# Day ${DAY} Lab" > "$FOLDER/README.md"
touch "$FOLDER/run.sh" "$FOLDER/verify.sh"

echo "[✓] Folder created: $FOLDER"
echo "[*] Next Step: Add your scripts and commit."
EOF

chmod +x devops_init.sh

