#!/bin/bash

service mariadb start

sleep 2

mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DATABASE};\
CREATE USER IF NOT EXISTS '${ADMIN_USER}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';\
GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${ADMIN_USER}'@'%';\
FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld_safe --bind-address=$DB_HOST --port=3306