How to use

Make sure your sql/datapump_expdp.par exists and points to the schema you want to export:

DIRECTORY=DATA_PUMP_DIR
DUMPFILE=backup_%U.dmp
LOGFILE=expdp.log
SCHEMAS=HR
CONTENT=ALL


Make the script executable:

chmod +x backup_pipeline.sh


Run it:

./backup_pipeline.sh


Logs will be created in ~/oracle-backup/output/:

rman_log_YYYYMMDD.log

datapump_log_YYYYMMDD.log

flashback_check.log

You can now run the Python verification script:

python3 verify_backups.py


Make sure your RMAN/Data Pump scripts write logs to a known folder:

# Example paths
RMAN_LOG="./output/rman_log_$(date +%Y%m%d).log"
DATAPUMP_LOG="./output/datapump_log_$(date +%Y%m%d).log"


Update LOG_DIR in the Python script to match that folder (on Oracle Linux).

Run your backups:

./backup_pipeline.sh


Run verification:

python3 verify_backups.py
