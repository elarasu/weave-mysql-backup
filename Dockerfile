# supervisord base image
#   docker build -t elarasu/weave-mysql-backup .
#
FROM elarasu/weave-ubuntu
MAINTAINER elarasu@outlook.com

# install mysql client
RUN  apt-get update \
  && apt-get install -yq cron mysql-client-5.6 --no-install-recommends \
  && mkdir -p /backup \
  && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* 

ENV CRON_TIME="0 0 * * *" \
    MYSQL_DB="--user-databases"
ADD run.sh /run.sh

VOLUME ["/backup"]

CMD ["/run.sh"]
