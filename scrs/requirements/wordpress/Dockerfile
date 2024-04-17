FROM debian:bullseye

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y php-fpm php7.4-mysqli wget mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp
#bypass typical permission checks and allows the download process to run with root privileges
RUN wp core download --allow-root

COPY tools/wp_script.sh .

RUN mkdir /run/php/

EXPOSE 9000

RUN echo "listen = wordpress:9000" >> /etc/php/7.4/fpm/php-fpm.conf

CMD ["bash", "wp_script.sh"]