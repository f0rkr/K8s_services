FROM alpine:latest

WORKDIR /home/

#Setup nginx 
RUN apk update && apk add nginx openrc libc6-compat bash && apk add --no-cache supervisor && openrc reboot
RUN apk add php7-fpm php7-mcrypt php7-soap php7-session php-mbstring php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype 
RUN adduser -g "Nginx www user" -h /home/www web -D
RUN echo "web:web" | chpasswd
COPY srcs/default.conf /etc/nginx/conf.d/
RUN mkdir /run/nginx

#Setup phpmyadmin
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip .
RUN unzip phpMyAdmin-5.0.4-all-languages.zip 
RUN mv phpMyAdmin-5.0.4-all-languages/* /home/www
RUN mkdir /home/www/tmp && chmod 777 /home/www/tmp
COPY srcs/config.inc.php /home/www/

#Setup superviseurd
COPY srcs/supervisord.conf /etc/supervisord.conf

#Setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz .
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 tele
COPY srcs/telegraf.conf /home/

EXPOSE 5000
CMD /usr/bin/supervisord -c /etc/supervisord.conf 
