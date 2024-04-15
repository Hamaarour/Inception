# Inception
I'm exploring system administration through Docker, virtualizing images in my personal VM for hands-on experience.




# Mariadb

Open another terminal and keep the terminal with the compose running. On this other terminal, run the following command to enter in the mariadb container.
```sql
docker exec -it mariadb /bin/bash
```
Then run the command to enter in the mysql
```sql
mysql -u your_user -p db_name
```
Then run the command to see the tables
```sql
SHOW TABLES;
```
If you see the tables, it means that all is ok. If you want to see the database, run the following command:
```sql
SELECT * FROM table_name\G;
```
And if you want to delete a row in a table, run the following command:
```sql
DELETE FROM table_name WHERE column_name = some_value;
```