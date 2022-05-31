FROM debian:buster

#Updating system and installing tools
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

#Copiing files to container
COPY ./conf/wordpress.sql .
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

#Creating db
RUN service mysql start && mysql < ./wordpress.sql && rm -f ./wordpress.sql

#Command after conteiner start
CMD /usr/bin/mysqld_safe