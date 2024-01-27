FROM alpine:latest

# Optional arguments.
ENV PROXY="false"

# install required packages.
RUN apk add --update --no-cache curl wget bash rsyslog

# Add crontab file in the cron directory
COPY cronjobs /etc/crontabs/root

# Give execution rights on the cron job
RUN chmod 0755 /etc/crontabs
RUN chmod 0600 /etc/crontabs/root

RUN mkdir cloudflare

# Create script.
COPY cloudflare.sh /cloudflare/cloudflare.sh
RUN chmod 0744 /cloudflare/cloudflare.sh

# Create entrypoint.
COPY entrypoint.sh /cloudflare/entrypoint.sh
RUN chmod 0744 /cloudflare/entrypoint.sh

# Disable imklog. 
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf

ENTRYPOINT ["/cloudflare/entrypoint.sh"]