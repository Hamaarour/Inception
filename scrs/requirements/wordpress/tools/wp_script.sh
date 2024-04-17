#!/bin/bash

# Function to wait for MariaDB
  until mariadb -h mariadb -u $ADMIN_USER -p$ADMIN_PASSWORD -e ";"
  do
    echo "Waiting for MariaDB to be ready..."
    sleep 3
  done

# Initialize WordPress (if not already configured)
initialize_wordpress() {
  if [[ ! -f wp-config.php ]]; then
    # Install  command line tool for managing WordPress installations.
    wp config create \
      --dbname="$DATABASE" \
      --dbuser="$ADMIN_USER" \
      --dbpass="$ADMIN_PASSWORD" \
      --dbhost="$DB_HOST" \
      --allow-root

    # Install WordPress

    wp core install \
      --url="$DOMAIN_NAME" \
      --title="$WP_TITLE" \
      --admin_user="$WP_ADMIN_LOGIN" \
      --admin_password="$WP_ADMIN_PASSWORD" \
      --admin_email="$WP_ADMIN_EMAIL" \
      --allow-root

    # Create a subscriber user 
    wp user create \
      "$WP_AUTHOR_LOGIN" \
      "$WP_AUTHOR_EMAIL" \
      --role=subscriber \
      --user_pass="$WP_AUTHOR_PASSWORD" \
      --allow-root
    wp theme install kubio --activate --allow-root
  else
    echo "WordPress is already configured."
  fi
}

initialize_wordpress

exec php-fpm7.4 -F
