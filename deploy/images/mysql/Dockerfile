FROM centos:6.8

MAINTAINER hexin <hexincloud@gmail.com>
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN yum install epel-release -y && rpm -Uvh http://repo.mysql.com//mysql57-community-release-el6-9.noarch.rpm
RUN yum install mysql-community-server perl pwgen  -y

RUN mkdir -p /data/db/mysql /data/logs/mysql /var/run/mysqld
RUN chown -R mysql:mysql /data/db/mysql /data/logs/mysql /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld /var/lib/mysql

RUN sed -Ei "s/^(bind-address)/#&/" /etc/my.cnf
RUN sed -Ei "s/^datadir.+?/datadir=\/data\/db\/mysql/" /etc/my.cnf
RUN sed -Ei "s/^log-error.+?/log-error=\/data\/logs\/mysql\/mysqld.log/" /etc/my.cnf
RUN sed -Ei "/^log-error/a\slow-query-log=true" /etc/my.cnf
RUN sed -Ei "/^slow-query-log/a\long-query-time=1" /etc/my.cnf
RUN sed -Ei "/^long-query-time/a\slow-query-log-file=\/data\/logs\/mysql\/slow_query.log" /etc/my.cnf

COPY entrypoint.sh /usr/local/bin/

COPY init.sql /entrypoint-initdb.d/
COPY comments.sql /entrypoint-initdb.d/
COPY update.sql /entrypoint-initdb.d/

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld", "-u", "mysql"]
