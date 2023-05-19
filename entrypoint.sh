#!/bin/bash

# Save environment values.
printenv | grep -v "no_proxy" >> /etc/environment

# Initialize cron job.
service rsyslog start && service cron start && tail -f /var/log/syslog