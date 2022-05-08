#!/bin/sh

# sed -i "s/bind-ad/\#bind-ad" "/etc/mysql/mariadb.conf.d/50-server.cnf"

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];    then
        /etc/init.d/mariadb setup
        rc-service mariadb start

        #Getting to new user root priveleges to db in localhost
        echo "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
        echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
        echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}

        #Getting to new user root priveleges on wp db
        echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
        echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
        echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}

        #Change password for root user
        mysql -u ${MYSQL_ROOT_USER} -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
fi

#
# sed -i ' s/skip-networking/# skip-networking/g ' /etc/my.cnf.d/mariadb-server.cnf
#rc-service mariadb restart
#rc-service mariadb stop
#
#/usr/bin/mariadb --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/ mysql/mariadb.pid
~