#checks if the wp-config.php file, which is essential for WordPress configuration, exists at the path /var/www/html/wordpress/
if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then

    # If the wp-config.php file is not found (meaning WordPress is not installed), the script proceeds with the installation:
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    # Verifies the downloaded WP-CLI tool.
    php wp-cli.phar --info
    # Makes the downloaded WP-CLI tool executable.
    chmod +x wp-cli.phar
    # Moves the WP-CLI tool to a standard location (/usr/local/bin/) for easier access
    mv wp-cli.phar /usr/local/bin/wp

    # Creates the directory structure for WordPress files if it doesn't exist.
    mkdir -p /var/www/html
    cd /var/www/html
    # Downloads the latest version of WordPress from the official website.
    wget https://wordpress.org/latest.zip
    unzip latest.zip
    rm -f latest.zip

    cd /var/www/html/wordpress

    # the WP-CLI tool to configure the WordPress connection to the MariaDB database and connect wordpress to mariadb
    # allow-root : This flag allows the script to use root privileges for database creation. It's generally recommended 
    #              to avoid using root privileges for security reasons.
    #              If possible, consider creating a dedicated user in the MariaDB container with appropriate permissions 
    #              and using that user's credentials instead.
    wp config create --dbname=wordpress_db --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root

    # create admin user
    wp core install --url=$DOMAIN_NAME --title="Inception"  --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

    # create author user
    wp user create  $WP_AUTHOR_LOGIN $WP_AUTHOR_EMAIL    --role=author --user_pass=$WP_AUTHOR_PASSWORD  --allow-root

    # Changes the ownership of the WordPress directory structure (/var/www/html/wordpress/) to the www-data user, 
    #       which is the user typically used by PHP-FPM. This ensures that the web server can access and write to WordPress files.
    chown -R www-data:www-data .
    # give the permissions to the group to enable both php-fpm and ftp to work with this directory
    chmod -R 775 .


fi

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
    exit 5
fi


php-fpm7.3 -F