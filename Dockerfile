FROM debian:latest

ENV PROXY="false"

# install required packages.
RUN apt-get update && \
    apt-get -y install curl && \
    apt-get -y install wget && \
    apt-get -y install cron && \
    apt-get -y install rsyslog && \
    apt-get clean

# Add crontab file in the cron directory
COPY cronjobs /etc/cron.d/cloudflare

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cloudflare

# Create the log file to be able to run tail
RUN touch /var/log/cloudflare.log

RUN mkdir cloudflare

# Create script.
COPY cloudflare.sh /cloudflare/cloudflare.sh
RUN chmod 0744 /cloudflare/cloudflare.sh

# Create entrypoint.
COPY entrypoint.sh /cloudflare/entrypoint.sh
RUN chmod 0744 /cloudflare/entrypoint.sh

ENTRYPOINT ["/cloudflare/entrypoint.sh"]