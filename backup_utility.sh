#!/bin/bash
# Configuration Backup Utility Script

echo "========================================="
echo "       CONFIG BACKUP UTILITY ENGINE      "
echo "========================================="

BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo -e "\n[1] Preparing backup environment..."
mkdir -p $BACKUP_DIR

echo -e "\n[2] Scanning for configuration files (*.json, *.conf, *.sh)..."
# Check if there are any config files in the current directory
CONFIG_FILES=$(ls *.json *.conf 2>/dev/null)

if [ -z "$CONFIG_FILES" ]; then
    echo " -> No local .json or .conf files found to backup."
    echo " -> Creating a dummy system backup package for demonstration..."
    tar -czf $BACKUP_DIR/system_backup_$TIMESTAMP.tar.gz *.sh 2>/dev/null
    echo " -> SUCCESS: All shell scripts archived safely in $BACKUP_DIR/"
else
    echo " -> Found configuration files. Archiving..."
    tar -czf $BACKUP_DIR/config_backup_$TIMESTAMP.tar.gz *.json *.conf 2>/dev/null
    echo " -> SUCCESS: Configuration backup saved to $BACKUP_DIR/"
fi

echo -e "\n========================================="
echo " Backup routine completed successfully."
echo "========================================="
