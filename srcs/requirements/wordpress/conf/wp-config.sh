#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html
	wp core download --allow-root

    wp config create	--allow-root --dbname=$DB_NAME \
						--dbuser=$ADMIN_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=$MYSQL_DB_HOST \
						--path="/var/www/html"

	wp core install		--allow-root --url=$WP_URL \
						--title=$WP_TITLE \
						--admin_user=$ADMIN_USER \
						--admin_password=$WP_ADMIN_PASSWORD \
						--admin_email=$ADMIN_EMAIL

	wp user create		--allow-root $WP_USER_LOGIN $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD
fi

exec "$@"