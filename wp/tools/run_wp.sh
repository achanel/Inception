#!/bin/sh

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.4/fpm/pool.d/www.conf";

wp core install --allow-root --url=${DOMAIN_NAME} --title=${DATABASE_NAME} --admin_user=${MYSQL_ROOT_USER} --admin_password=${MYSQL_ROOT_PASS} --admin_email=${MYSQL_ROOT_EMAIL};

wp user create ${MYSQL_USER} ${MYSQL_USER_EMAIL} --user_pass=${MYSQL_PASS} --role=author --allow-root;

wp theme install neve --activate --allow-root

# enable redis cache
    sed -i "40i define( 'WP_REDIS_HOST', '$REDIS_HOST' );"      wp-config.php
    sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               wp-config.php
    #sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );"   wp-config.php
    sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
    sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
    sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php

    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root

echo "Wordpress: set up!"
else
echo "Wordpress: is already set up!"
fi

wp redis enable --allow-root

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7.3 -F