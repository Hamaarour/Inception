FROM debian:bullseye

RUN     apt-get update -y && apt-get upgrade -y 

RUN     apt-get -y install wget

RUN     apt-get install -y php7.3\
    php-fpm\
    php-mysql\
    mariadb-client

RUN     wget https://en.wordpress.org/wordpress-6.5.tar.gz -P /var/www

RUN     cd /var/www && tar -xzf wordpress-6.5.tar.gz && rm wordpress-6.5.tar.gz

RUN		chown -R root:root /var/www/wordpress