FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

RUN mkdir -p /run/mysqld; \
    chmod 777 /run/mysqld; \
    chown -R mysql:mysql /run/mysqld; \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql; \
    chmod 777 /var/lib/mysql; \
    chown -R mysql:mysql /var/lib/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/


COPY ./tools/db.sh /

RUN chmod +x /db.sh

CMD ["/db.sh"]

