#!/bin/bash
until mysql -h"$DB_HOST" -u"$SQL_USER" -p"$SQL_PASSWORD" -e "USE $SQL_DATABASE" 2>/dev/null ; do
    echo "Wait for MariaDB to be ready!!"
    sleep 3
done

if ! [ -f wp-config.php ]; then
    wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=$DB_HOST --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create $WP_AUTHOR_LOGIN $WP_AUTHOR_EMAIL --role=subscriber --user_pass=$WP_AUTHOR_PASSWORD --allow-root
else
    echo "Wordpress is ready"
fi

exec php-fpm7.4 -F
# # Function to wait for MariaDB
# wait_for_mariadb() {
#   until mysql -h "$DB_HOST" -u "$SQL_USER" -p"$SQL_PASSWORD" -e "USE $SQL_DATABASE" &> /dev/null; do
#     echo "Waiting for MariaDB to be ready..."
#     sleep 3
#   done
# }

# # Initialize WordPress (if not already configured)
# initialize_wordpress() {
#   if [[ ! -f wp-config.php ]]; then
#     # Install  command line tool for managing WordPress installations.
#     wp config create \
#       --dbname="$SQL_DATABASE" \
#       --dbuser="$SQL_USER" \
#       --dbpass="$SQL_PASSWORD" \
#       --dbhost="$DB_HOST" \
#       --allow-root

#     # Install WordPress

#     wp core install \
#       --url="$DOMAIN_NAME" \
#       --title="$WP_TITLE" \
#       --admin_user="$WP_ADMIN_LOGIN" \
#       --admin_password="$WP_ADMIN_PASSWORD" \
#       --admin_email="$WP_ADMIN_EMAIL" \
#       --allow-root

#     # Create a subscriber user 
#     wp user create \
#       "$WP_AUTHOR_LOGIN" \
#       "$WP_AUTHOR_EMAIL" \
#       --role=subscriber \
#       --user_pass="$WP_AUTHOR_PASSWORD" \
#       --allow-root
#   else
#     echo "WordPress is already configured."
#   fi
# }

# wait_for_mariadb

# initialize_wordpress

# exec php-fpm7.4 -F
