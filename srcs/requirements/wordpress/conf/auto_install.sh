#!/bin/bash

# Replace options on configuration file
# sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;

# If the WordPress config file doesn't exist
if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	cd /var/www/html
	wp core download --allow-root

	echo -e "Creating wp-config.php..."
    wp config create	--allow-root --dbname="mariadb" \
						--dbuser=${MYSQL_USER} \
						--dbpass=${MYSQL_PASSWORD} \
						--dbhost=${MYSQL_DB_HOST} \
						--path="/var/www/html" \
						--dbcharset="utf8" \
						--dbcollate="utf8_general_ci"

	echo -e "\e[32m[wp-config.php created]\e[0m"

	echo -e "Installing WordPress..."
	wp core install		--allow-root --url=${WP_URL} \
						--title=${DB_NAME} \
						--admin_user=${WP_ADMIN_USER} \
						--admin_password=${WP_ADMIN_PASSWORD} \
						--admin_email=${WP_ADMIN_EMAIL} \
						--skip-email

	echo -e "\e[32m[WordPress installed]\e[0m"
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}
  	echo "Wordpress: set up!"
fi

exec "$@"