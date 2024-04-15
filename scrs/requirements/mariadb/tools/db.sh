#!/bin/bash

sleep 10
echo "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" > database.sql
echo "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" >> database.sql
echo "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" >> database.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql

service mariadb start
mysqld < database.sql
service mariadb stop

mysqld --user=mysql --init-file=/database.sql
