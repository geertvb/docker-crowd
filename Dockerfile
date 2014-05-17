#
# Crowd Dockerfile
#
# https://github.com/GeertVB/docker-crowd
#

FROM 192.168.0.29:5000/geertvb/docker-java

RUN \
  apt-get update && \
  apt-get -y upgrade

RUN \
  apt-get install -y curl

RUN \
  mkdir -p /opt/crowd

WORKDIR /opt/crowd

RUN \
  curl -O http://downloads.atlassian.com/software/crowd/downloads/atlassian-crowd-2.7.2.tar.gz && \
  tar zxf atlassian-crowd-2.7.2.tar.gz --strip=1 -C /opt/crowd && \
  rm atlassian-crowd-2.7.2.tar.gz

RUN \
  mkdir -p /var/crowd-home && \
  echo "crowd.home = /var/crowd-home" >> /opt/crowd/crowd-webapp/WEB-INF/classes/crowd-init.properties
    
CMD /bin/bash
