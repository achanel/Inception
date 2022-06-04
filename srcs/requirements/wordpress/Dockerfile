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

CMD bash /var/www/wp_run.sh

# RUN apt update && \
#   apt install -y wget php php-fpm php-mysql php-cli nano curl net-tools && \
#   bash /etc/init.d/php7.3-fpm start && \
#   wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
#   mkdir /var/www/ /var/www/html && \
#   tar -xvf /tmp/wordpress.tar.gz -C /var/www/html && \
#   chown -R www-data:www-data /var/www/html/wordpress && \
#   chmod -R 775 /var/www/html/wordpress 

# COPY ./conf/* /
# COPY ./tools/* /

# EXPOSE 9000

# CMD bash /tmp/start.sh