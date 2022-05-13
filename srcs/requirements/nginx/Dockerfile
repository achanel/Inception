FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx php-gd php-xml -y procps
RUN apt-get install net-tools
RUN apt-get install curl -y

RUN mkdir /etc/nginx/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt \
        -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21/OU=School/CN=localhost"

COPY ./conf/nginx.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/site.conf
RUN rm /etc/nginx/sites-enabled/site.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]