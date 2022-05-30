FROM debian:buster

#Updating system and installing tools
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

#Copiing files to container
COPY ./conf/wordpress.sql .
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

#Opening port
EXPOSE 3306

RUN service mysql start && mysql < ./wordpress.sql && rm -f ./wordpress.sql

CMD /usr/bin/mysqld_safe