#
# Crowd Dockerfile
#
# https://github.com/GeertVB/docker-crowd
#

FROM 192.168.0.29:5000/geertvb/docker-atlassian-sdk

RUN \
  apt-get update && \
  apt-get -y upgrade

EXPOSE 4990
  
CMD atlas-run-standalone --product crowd --version 2.7.2
