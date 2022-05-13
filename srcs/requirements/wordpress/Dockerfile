FROM debian:buster

#Updating system and installing tools
RUN apt-get update
RUN apt-get install -y openrc
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y php php-fpm php-common \
        php-iconv php-json \
        php-gd php-curl php-xml php-mysqli php-imap\
        php-cgi php-pdo php-soap \
        php-xmlrpc php-posix php-gettext \
        php-ldap php-ctype php-dom \
        php-mbstring php-phar \
        curl

#Downloading WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN rm latest.tar.gz

#Downloading Redis-Cache
RUN wget https://downloads.wordpress.org/plugin/redis-cache.2.0.25.zip
RUN unzip redis-cache.2.0.25.zip
RUN rm redis-cache.2.0.25.zip

#Adding files to container
ADD ./conf/object-cache.php /wordpress/wp-content
COPY conf/wp-config.php /wordpress/wp-config.php

RUN openrc
RUN touch /run/openrc/softlevel

#Adding installing script
COPY tools/wp_run.sh /
COPY conf/www.conf /etc/php/7.4/fpm/php-fpm.conf
RUN chmod +x ./wp_run.sh

ENTRYPOINT [ "./wp_run.sh" ]