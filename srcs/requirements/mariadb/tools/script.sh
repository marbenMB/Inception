#!/bin/bash


service mariadb start

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

echo "CREATE DATABASE IF NOT EXISTS ${M_DB_NAME};" > maria.sql
echo "CREATE USER IF NOT EXISTS '${M_USER_NAME}'@'%' IDENTIFIED BY '${M_USER_PASS}';" >> maria.sql
echo "GRANT ALL PRIVILEGES ON ${M_DB_NAME}.* TO '${M_USER_NAME}'@'%';" >> maria.sql
echo "FLUSH PRIVILEGES;" >> maria.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${M_ROOT_PASS}';" >> maria.sql

mariadb < maria.sql

mysqladmin shutdown -p${M_ROOT_PASS}

exec "$@"