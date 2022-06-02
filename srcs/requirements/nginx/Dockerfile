FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx openssl -y

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
# RUN	ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf;

RUN mkdir /etc/nginx/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/certs/nginx.crt \
        -subj "/C=RU/ST=Tatarstan/L=Kazan/O=wordpress/CN=achanel.42.fr"

ENTRYPOINT ["nginx", "-g", "daemon off;"]