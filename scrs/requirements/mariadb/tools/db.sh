#!/bin/bash


sleep 5
service mysql start 


mysql -u root -e "CREATE DATABASE IF NOT EXISTS inception ;"
mysql -u root -e "CREATE USER IF NOT EXISTS 'hicham'@'%' IDENTIFIED BY '123456789' ;" 
mysql -u root -e "GRANT ALL PRIVILEGES ON inception.* TO 'hicham'@'%' ;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '123456789' ;"
mysql -u root -e "FLUSH PRIVILEGES ;"
