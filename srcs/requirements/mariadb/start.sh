#!/bin/sh
mysqld & sleep 5
service mysql start
mysql -e "CREATE USER '${MARIADB_USER}'@'localhost' identified by '${MARIADB_PASSWORD}';" &&\
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" &&\
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';" &&\
mysql -e "FLUSH PRIVILEGES;drop user ''@localhost; drop user 'mysql'@localhost;"
service mysql stop
pkill mariadb
pkill mysqld
exec mysqld && mariadb
