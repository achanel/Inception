FROM debian:buster

#Updating system and installing tools
RUN apt-get update
RUN apt-get install -y openrc
RUN apt-get install -y wget
RUN apt install -y php7.3 php-mysqli php-fpm curl sendmail

#Downloading WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN rm latest.tar.gz

#Adding files to container
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/wp-config.php /wordpress/wp-config.php

#Adding installing script
COPY tools/run_wp.sh /
RUN chmod +x ./run_wp.sh