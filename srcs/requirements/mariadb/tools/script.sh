#!/bin/bash

service mariadb start

mariadb < /var/maria.sql

# mysqld_safe 
tail -f;