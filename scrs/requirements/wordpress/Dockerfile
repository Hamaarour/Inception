FROM debian:bullseye


RUN apt-get update && \
    apt-get install -y wget curl unzip php7.4 php7.4-fpm php7.4-mysql mariadb-client && \
    mkdir -p /run/php/

COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/pool.d/www.conf


COPY ./tools/wp_install.sh /wp_install.sh

CMD ["bash", "/wp_install.sh"]