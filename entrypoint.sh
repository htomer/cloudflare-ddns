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

# Initialize cron job.
service rsyslog start && service cron start && tail -f /var/log/syslog