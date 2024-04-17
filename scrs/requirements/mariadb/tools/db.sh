#!/bin/bash

service mariadb start

sleep 2

mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};\
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';\
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';\
FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld_safe --bind-address=$DB_HOST --port=3306