service mysql start
echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;" | mysql -u root
echo "DROP USER IF EXISTS 'achanel'@'localhost';" | mysql -u root
echo "CREATE USER 'achanel'@'localhost' IDENTIFIED BY 'achapas';" | mysql -u root
echo "GRANT ALL ON *.* TO '$DATABASE_USER'@'localhost' IDENTIFIED BY '$DATABASE_PASS' WITH GRANT OPTION;" | mysql -u root
echo "flush privileges" | mysql -u root
if [ ! -d "/var/lib/mysql/wordpress" ]
then
        mysql '$DATABASE_NAME' < wordpress.sql
fi
service mysql stop
/usr/bin/mysqld_safe