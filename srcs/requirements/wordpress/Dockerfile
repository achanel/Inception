FROM debian:buster

#Updating system and installing tools
RUN apt-get update
RUN apt-get install -y php php-fpm sudo apt-get install php7.4-common \
	apt-get install php7.3-iconv \
	apt-get install php7.3-json \
	apt-get install php7.3-gd \
	apt-get install php7.3-xml \
	apt-get install php7.3-mysql \
	apt-get install php7.3-imap \
	apt-get install php7.3-cgi fcgi\
	apt-get install php7.3-pdo \
	apt-get install php7.3-soap \
	apt-get install php7.3-xmlrpc \
	apt-get install php7.3-posix \
	apt-get install php7.3-gettext \
	apt-get install php7.3-ldap \
	apt-get install php7.3-ctype \
	apt-get install php7.3-dom \
	apt-get install php7.3-mbstring \
	apt-get install php7.3-phar \
	apt-get install php7.3-curl \
	apt-get install php7.3-mcrypt \
	apt-get install php7.3-opache

#Downloading WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN rm latest.tar.gz

#Downloading Redis-Cache
RUN wget https://downloads.wordpress.org/plugin/redis-cache.2.0.25.zip
RUN unzip redis-cache.2.0.25.zip
RUN rm redis-cache.2.0.25.zip

#Adding files to container
ADD ./conf/cache.php /wordpress/wp-content
COPY conf/wp_config.php /wordpress/wp-config.php

RUN openrc
RUN touch /run/openrc/softlevel

#Adding installing script
COPY tools/wp_run.sh /
COPY conf/www.conf /etc/php7.3/php-fpm.d
RUN chmod +x ./wp_run.sh

ENTRYPOINT [ "./wp_run.sh" ]