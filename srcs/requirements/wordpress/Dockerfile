FROM debian:buster

#Updating system and installing tools
RUN apt-get update
RUN apt-get -y install php7.3 php-mysql php-fpm sendmail curl

#Copiing files to oconteiner
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/wp-config.php /var/www/
COPY tools/wp_run.sh	/var/www

COPY conf/index.html /var/www/index.html

# RUN chmod 
RUN chmod +x /var/www/wp_run.sh

ENTRYPOINT [ "./var/www/wp_run.sh" ]
