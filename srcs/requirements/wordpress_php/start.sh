#!/bin/sh

sleep 10
n=`echo "use wordpress;show tables;" | mariadb -h${MARIADB_HOST} -D${MARIADB_DATABASE} -u${MARIADB_USER} -p${MARIADB_PASSWORD} -P${MARIADB_PORT} | wc -l`
if [ $n == 0 ]; then
	wp core install --url="$WP_SITE" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_EMAIL" --skip-email
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass="$WP_USER_PASSWORD"
fi

cd ../../../.. && sudo chown -R nginx:nginx /var/www/ && chown nginx:nginx /var/www/wordpress && chmod 755 /var/www/wordpress

exec php-fpm7 -F
