#!/bin/bash

set -e

apt-get update

export DEBIAN_FRONTEND=noninteractive

apt-get install -y tzdata && \
ln -sf /usr/share/zoneinfo/America/Araguaina /etc/localtime  && \
dpkg-reconfigure --frontend noninteractive tzdata

apt-get install -y openjdk-8-jre unzip && \
apt-get install -y libreoffice-core && \
apt-get install -y libreoffice --no-install-recommends

cd /assets/ && \
unzip jodconverter-tomcat-2.2.2.zip && \
mv jodconverter-tomcat-2.2.2 /opt/

mv /assets/entrypoint.sh /
chmod +x /entrypoint.sh

rm -rf /assets
apt-get clean && apt-get autoclean

exit 0
