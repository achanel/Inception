FROM debian:buster

RUN	apt-get update && apt-get install -y vsftpd ftp

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/run_ftps.sh /

RUN chmod +x ./run_ftps.sh
ENTRYPOINT [ "/run_ftps.sh" ]