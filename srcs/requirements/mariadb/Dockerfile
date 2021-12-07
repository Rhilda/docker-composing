FROM alpine:3.13
RUN apk update \
	&& apk add mariadb \
	mariadb-client

RUN mkdir -p /var/run/mysqld \
	&& mkdir -p /var/lib/mysql \
	&& mkdir -p /var/log/mysql \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& chown -R mysql:mysql /var/log/mysql

RUN mariadb-install-db --user=mysql --datadir='/var/lib/mysql'
COPY mariadb-server.cnf /etc/my.cnf.d/
RUN chown -R mysql:mysql /etc/mysql
COPY start.sh .
RUN chmod +x start.sh
RUN mkdir /data
RUN chown -R mysql:mysql /data
USER mysql:mysql
ENTRYPOINT ["sh", "start.sh"]
