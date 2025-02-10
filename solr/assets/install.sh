#!/bin/bash

set -e

apt-get update

export DEBIAN_FRONTEND=noninteractive

apt-get install -y tzdata && \
ln -sf /usr/share/zoneinfo/America/Araguaina /etc/localtime  && \
dpkg-reconfigure --frontend noninteractive tzdata

apt-get install -y openjdk-8-jre curl

useradd solr

curl https://archive.apache.org/dist/lucene/solr/8.2.0/solr-8.2.0.tgz -o /tmp/solr-8.2.0.tgz

mv /assets/solr-sei-config/* /tmp/

chmod +x /tmp/sei-solr-8.2.0.sh
sh /tmp/sei-solr-8.2.0.sh

mv /assets/entrypoint.sh /
chmod +x /entrypoint.sh

rm -rf /assets && \
rm -rf /tmp/sei-cores-8.2.0 && \
rm -rf /tmp/log4j.properties && \
rm -rf /tmp/sei-solr-8.2.0.sh && \
rm -rf /tmp/solr.service && \
rm -rf /tmp/solr-8.2.0.tgz && \
rm -rf /tmp/solr-8.2.0

apt-get clean && apt-get autoclean

exit 0
