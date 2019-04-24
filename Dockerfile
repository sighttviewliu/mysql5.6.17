#V5.6.17
FROM centos:7.4

WORKDIR /
ADD opt_2/MySQL-5.6.17-1.el6.x86_64.rpm-bundle.tar /
RUN rm MySQL-embedded-5.6.17-1.el6.x86_64.rpm MySQL-test-5.6.17-1.el6.x86_64.rpm \ 
    && yum install -y MySQL-shared-5.6.17-1.el6.x86_64.rpm \
	MySQL-shared-compat-5.6.17-1.el6.x86_64.rpm MySQL-devel-5.6.17-1.el6.x86_64.rpm \
	MySQL-client-5.6.17-1.el6.x86_64.rpm MySQL-server-5.6.17-1.el6.x86_64.rpm
RUN rm MySQL-shared-5.6.17-1.el6.x86_64.rpm \
	MySQL-shared-compat-5.6.17-1.el6.x86_64.rpm MySQL-devel-5.6.17-1.el6.x86_64.rpm \
	MySQL-client-5.6.17-1.el6.x86_64.rpm MySQL-server-5.6.17-1.el6.x86_64.rpm

ENTRYPOINT [ "/bin/bash" ]