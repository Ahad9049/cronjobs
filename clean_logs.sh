#!/bin/bash

# --- Configuration ---
LOG_DIR="/var/log/my_custom_app"      # Change to your app's log folder
DAYS_TO_COMPRESS=7
DAYS_TO_DELETE=30
TIMESTAMP=$(date +"%Y-%m-%d")

# --- Execution ---

# 1. Compress logs older than 7 days that aren't already compressed
# This finds .log files and turns them into .log.gz
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_TO_COMPRESS -exec gzip {} \;

# 2. Delete any compressed logs older than 30 days
find "$LOG_DIR" -type f -name "*.gz" -mtime +$DAYS_TO_DELETE -delete

# 3. Optional: Add an entry to a master maintenance log
echo "Maintenance performed on $TIMESTAMP: Logs compressed/cleaned." >> /var/log/sys_maintenance.log