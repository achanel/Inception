#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
echo "Setting..."

echo "Setting up wp client..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;

cd /var/www/html;

echo "Setting up static website..."
mkdir -p /var/www/html/wordpress/static;
mv /var/www/index.html /var/www/html/wordpress/static/index.html;

echo "Setting up wordpress..."
wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html

echo "Wordpress: creating users..."
wp core install --allow-root --url=${DOMAIN_NAME} --title=${DATABASE_NAME} --admin_user=${MYSQL_ROOT_USER} --admin_password=${MYSQL_ROOT_PASS} --admin_email=${MYSQL_ROOT_EMAIL};
wp user create ${MYSQL_USER} ${MYSQL_USER_EMAIL} --user_pass=${MYSQL_USER_PASS} --role=author --allow-root;

echo "Setting up Redis-cache..."
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

echo "WELL DONE!"
else
echo "wp-config is already exist!"
fi

chown -R www-data:www-data /var/www/html;
chmod -R 755 /var/www/html;
wp redis enable --allow-root
echo "Wordpress is started!"

/usr/sbin/php-fpm7.3 --nodaemonize

# wp core config --dbhost=${DATABASE_HOST} --dbname=${DATABASE_NAME} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_PASSWORD} --allow-root
# wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${MYSQL_ROOT_USER} --admin_password=${MYSQL_ROOT_PASS} --admin_email=${MYSQL_ROOT_EMAIL} --skip-email --allow-root
# wp user create ${MYSQL_USER} ${MYSQL_USER_EMAIL} --allow-root --role=subscriber --user_pass=${MYSQL_USER_PASS}
