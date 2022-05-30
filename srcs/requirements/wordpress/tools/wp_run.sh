if ! [ -d "/var/www/wordpress/wp-config.php" ]; then
    wp core config --dbhost=${DATABASE_HOST} --dbname=${DATABASE_NAME} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_PASS} --allow-root
    wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${MYSQL_ROOT_USER} --admin_password=${MYSQL_ROOT_PASS} --admin_email=${MYSQL_ROOT_EMAIL} --skip-email --allow-root
    wp user create ${DATABASE_USER} ${MYSQL_USER_EMAIL} --allow-root --role=subscriber --user_pass=${MYSQL_USER_PASS}
fi

/usr/sbin/php-fpm7.3 --nodaemonize