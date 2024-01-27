#!/bin/bash

checkForVariable() {
    if [[ -z ${!1+set} ]]; then
       echo "Error: Define $1 environment variable"
       exit 1
    fi
}

# check environment variables.
checkForVariable EMAIL
checkForVariable KEY
checkForVariable ZONE
checkForVariable RECORD

# Save environment values.
printenv | grep -v "no_proxy" >> /etc/environment

# Create necessary directories and files.
mkdir -p /var/log
touch /var/log/messages

# Initialize cron job.
rsyslogd && crond && tail -f /var/log/messages