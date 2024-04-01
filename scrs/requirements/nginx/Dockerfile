FROM debian:bullseye

# install nginx and all dependencies
RUN		apt-get update
RUN		apt-get install -y nginx openssl

# create the directory for the ssl certificate
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed certificate
RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes \
    -out /etc/nginx/ssl/hamaarou.crt \
    -keyout /etc/nginx/ssl/hamaarou.key \
    -subj "/C=MA/ST=BENGURIR/L=BENGURIR/O=42/OU=1337/CN=hamaarou.42.fr"

# copy the nginx configuration file
COPY ./conf/nginx.conf /etc/nginx/sites-available

# expose the port 443
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
