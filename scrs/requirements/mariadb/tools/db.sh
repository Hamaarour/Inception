#!/bin/bash


sleep 5
echo "CREATE DATABASE inception ;" > database.sql
echo "GRANT ALL PRIVILEGES ON inception.* TO 'hicham'@'%' IDENTIFIED BY '123456';" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql

mysqld --user=mysql --init-file=/database.sql