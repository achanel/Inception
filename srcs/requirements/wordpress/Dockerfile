FROM debian:buster

#Updating system and installing tools
RUN apt-get update
RUN apt-get install -y php php-fpm apt-get install php7.4-common \
	php7.3-iconv php7.3-json php7.3-gd \
	php7.3-xml php7.3-mysql php7.3-imap \
	php7.3-cgi fcgi php7.3-pdo php7.3-soap \
	php7.3-xmlrpc php7.3-posix php7.3-gettext \
	php7.3-ldap php7.3-ctype php7.3-dom \
	php7.3-mbstring php7.3-phar php7.3-curl \
	php7.3-mcrypt php7.3-opache

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