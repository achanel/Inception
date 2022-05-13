FROM debian:buster

#Updating system and installing tools
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

#Copiing files to container
COPY conf/wordpress.sql .
COPY conf/50-server.cnf /etc/mysql

#Adding installing script
ADD tools/db_run.sh .
RUN chmod +x /db_run.sh

CMD bash db_run.sh