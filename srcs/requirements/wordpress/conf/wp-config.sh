#!/bin/bash

if [! wp-config.php]; then
    wp config create --allow-root --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
    wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WPADMIN_EMAIL
    wp user create $WP_USER $WP_EMAIL --user_pass=$WP_USER_PASSWORD
fi

