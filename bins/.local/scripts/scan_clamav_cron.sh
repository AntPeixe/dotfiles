#!/bin/bash
echo "Updating ClamAV virus database..."
freshclam
echo "Starting ClamAV scan..."
clamscan -ri --move=/var/log/clamav/quarantine / 2>&1 | tee /var/log/clamav/cron_scan.log
echo "ClamAV scan completed."

