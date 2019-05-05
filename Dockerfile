#V5.6.17
FROM centos:7.4

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN yum -y install gnupg dirmngr

ENV GOSU_VERSION 1.7

RUN set -x \
    && yum -y install ca-certificates wget \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && yum -y remove ca-certificates wget


