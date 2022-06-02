#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";


mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
echo "Wordpress: setting up..."

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;

chmod +x wp-cli.phar;

mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html;


# static website
	# mkdir -p /var/www/html/wordpress/mysite;
    # mv /var/www/index.html /var/www/html/wordpress/mysite/index.html;

wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html
echo "Wordpress: creating users..."

wp core install --allow-root --url=${DOMAIN_NAME} --title=${DATABASE_NAME} --admin_user=${MYSQL_ROOT_USER} --admin_password=${MYSQL_ROOT_PASS} --admin_email=${MYSQL_ROOT_EMAIL};

wp user create ${MYSQL_USER} ${MYSQL_USER_EMAIL} --user_pass=${MYSQL_USER_PASS} --role=author --allow-root;
# Тема для WordPress
wp theme install neve --activate --allow-root

echo "Wordpress: set up!"
else
echo "Wordpress: is already set up!"
fi

chown -R www-data:www-data /var/www/html;

chmod -R 755 /var/www/html;

echo "Wordpress started on :9000"

/usr/sbin/php-fpm7.3 -F