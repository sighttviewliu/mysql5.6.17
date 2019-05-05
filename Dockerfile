#V5.6.17
FROM centos:7.4

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN yum -y install gnupg dirmngr ca-certificates wget pwgen perl

COPY gosu /usr/local/bin/

RUN set -x \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true

RUN mkdir /docker-entrypoint-initdb.d

RUN set -ex

COPY mysql-community.repo /etc/yum.repos.d/

RUN yum -y install mysql-community-server-5.6.17-4.el7.x86_64 \
    && rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \ 
    && chmod 777 /var/run/mysqld

COPY my.cnf /etc/
COPY docker.cnf /etc/mysql/conf.d/

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /usr/local/bin/

RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ] 

EXPOSE 3306

CMD ["mysqld"]