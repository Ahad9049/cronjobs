#!/bin/bash

# --- Configuration ---
SOURCE_DIR="/workspaces/cronjobs/file.db"       # What you want to back up
BACKUP_DIR="/workspaces/cronjobs/backups"     # Where to save the backup
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
LOG_FILE="/var/log/backup_log.txt"       # Optional: track success/failure

# --- Execution ---
# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create the compressed archive
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

# --- Optional: Cleanup ---
# Delete backups older than 30 days to save space
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +30 -delete

# --- Log the result ---
echo "Backup created: $BACKUP_NAME at $(date)" >> "$LOG_FILE"#!/bin/bash

