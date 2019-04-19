#V5.6.17
FROM centos:7.4

RUN yum install -y libaio-devel.x86_64 numactl.x86_64 &&\
	yum clean all

ENV MYSQL_HOME /usr/local/mysql/
ENV PATH $PATH:$MYSQL_HOME/bin

ENV MYSQL_VERSION 5.6.17
ENV GLIC_VERSION 2.5

ADD my.cnf /etc 	
ADD startup.sh /
ADD mysql-${MYSQL_VERSION}-linux-glibc${GLIC_VERSION}-x86_64.tar.gz /usr/local

RUN mv /usr/local/mysql-${MYSQL_VERSION}-linux-glibc${GLIC_VERSION}-x86_64 /usr/local/mysql &&\
	useradd mysql && \
	chmod 777 /startup.sh &&\
	chmod 664 /etc/my.cnf &&\
	chown mysql:mysql -R /usr/local/mysql

EXPOSE 3306
CMD ["/startup.sh"]