FROM debian:buster

#Updating system and installing tools
RUN apt-get update
RUN apt-get -y install php7.3 php-mysqli php-fpm mariadb-client curl

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/wp-config.php /wordpress/wp-config.php

ADD https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/html/
RUN cd /var/html && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz
RUN rm -f /var/html/wordpress-5.7.2-ru_RU.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN rm -f /var/html/wordpress/wp-config-sample.php
RUN mkdir /run/php/

WORKDIR /var/html/wordpress
COPY	/tools/wp_run.sh /
RUN		chmod +x /wp_run.sh
CMD		/wp_run.sh