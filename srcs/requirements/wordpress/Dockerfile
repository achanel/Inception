FROM debian:buster

#Updating system and installing tools
RUN apt-get update
RUN apt-get -y install php7.3 php-mysqli php-fpm sendmail curl

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/wp-config.php /var/www/
COPY tools/wp_run.sh	/var/www

COPY conf/index.html /var/www/index.html

CMD bash /var/www/wp_run.sh