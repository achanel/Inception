FROM debian:buster

#Updating system and installing tools
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

#Copiing files to container
COPY conf/wordpress.sql .

#Adding installing script
ADD tools/db_run.sh .
RUN chmod +x /db_run.sh

ENTRYPOINT [ "./db_run.sh" ]