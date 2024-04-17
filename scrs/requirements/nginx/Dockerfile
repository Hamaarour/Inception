FROM debian:bullseye

RUN		apt-get update && apt-get upgrade -y
RUN		apt-get install -y nginx openssl

RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes \
    -out /etc/ssl/certs/hamaarou.crt \
    -keyout /etc/ssl/private/hamaarou.key \
    -subj "/C=MA/ST=BENGURIR/L=BENGURIR/O=42/OU=1337/CN=hamaarou.42.fr"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
