#V5.6.17
FROM centos:7.4

#RUN groupadd -r mysql && useradd -r -g mysql mysql

WORKDIR /

COPY repo/mysql-community.repo /etc/yum.repos.d/
COPY repo/CentOS-Base.repo /etc/yum.repos.d/
COPY repo/*.rpm /
COPY etc/selinux/config /etc/selinux/

RUN yum install -y *.rpm
#RUN yum install -y wget autoconf libaio mysql-community-server-5.6.17-4.el7.x86_64

EXPOSE 3306
CMD [ "/bin/bash" ]