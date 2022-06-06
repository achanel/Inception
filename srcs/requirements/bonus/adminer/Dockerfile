FROM debian:buster

# Update System and Install Tools
RUN apt-get update
RUN apt-get -y install wget php7.3 php-mysql php-fpm

# Download adminer file
RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php"

# Rename file to index.php
RUN mv adminer-4.8.1.php index.php

# Start a built-in Server and make it accessible on port 7077 to any interface
CMD php -S 0.0.0.0:8080