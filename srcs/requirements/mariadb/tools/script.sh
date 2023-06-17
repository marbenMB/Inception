#!/bin/bash

service mariadb start

echo "CREATE DATABASE ${M_DB_NAME};" > maria.sql
echo "CREATE USER '${M_USER_NAME}'@'%' IDENTIFIED BY '${M_USER_PASS}';" >> maria.sql
echo "GRANT ALL PRIVILEGES ON ${M_DB_NAME}.* TO '${M_USER_NAME}'@'%';" >> maria.sql
echo "FLUSH PRIVILEGES;" >> maria.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${M_ROOT_PASS}';" >> maria.sql

mariadb < maria.sql

mysqladmin shutdown -p${M_ROOT_PASS} 

exec "$@"