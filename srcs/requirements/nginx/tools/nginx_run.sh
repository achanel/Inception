#!/bin/sh

#creating SSL certificate
openssl req -x509 -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt \
        -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21/OU=School/CN=localhost"

#telling nginx stay in the foreground
nginx -g "daemon off;"