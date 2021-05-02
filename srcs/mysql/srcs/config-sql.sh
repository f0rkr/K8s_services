#!/bin/sh

[ "$(ls -A /var/lib/mysql)" ] && a="Not Empty" || a="Empty"
if [ "$a" = "Empty" ]
then
    /etc/init.d/mariadb setup
    /etc/init.d/mariadb start
    echo "CREATE DATABASE phpmyadmin;" |mysql -u root --skip-password 
    echo "GRANT ALL PRIVILEGES ON *.* TO 'pma'@'%' IDENTIFIED BY 'root';" |mysql -u root --skip-password 
    echo "FLUSH PRIVILEGES;" |mysql -u root --skip-password
    echo "CREATE DATABASE wordpress;" |mysql -u root --skip-password 
    echo "CREATE USER 'mashad'@'%' IDENTIFIED BY 'root';" |mysql -u root --skip-password 
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'mashad'@'%';" |mysql -u root --skip-password 
    echo "FLUSH PRIVILEGES;" |mysql -u root --skip-password && echo "CREATE DATABASE app_db;" |mysql -u root --skip-password 
    echo "CREATE USER 'tele'@'localhost' IDENTIFIED BY 'tele';" |mysql -u root --skip-password 
    echo "GRANT ALL PRIVILEGES ON *.* TO 'tele'@'localhost';" |mysql -u root --skip-password 
    echo "FLUSH PRIVILEGES;" |mysql -u root --skip-password 
    mariadb < /home/phpmyadmin.sql -u root
    mariadb < /home/wordpress.sql -u root
    /etc/init.d/mariadb stop
fi

/usr/bin/supervisord -c /etc/supervisord.conf 
