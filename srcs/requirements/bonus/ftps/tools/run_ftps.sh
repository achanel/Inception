#!/bin/sh

mkdir -p /var/run/vsftpd/empty
cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

adduser ${FTP_USER} --disabled-password && echo ${FTP_USER}:${FTP_PASS} | chpasswd
chown -R ${FTP_USER}:${FTP_USER} /var/www/html/wordpress/
echo ${FTP_USER} | tee -a /etc/vsftpd.userlist &> /dev/null

echo "ftps is running..."

/usr/sbin/vsftpd /etc/vsftpd.conf