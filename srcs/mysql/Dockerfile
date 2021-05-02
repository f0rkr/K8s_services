FROM alpine:latest

WORKDIR /home/
#Setup mariadb
RUN apk update && apk add mariadb mariadb-common mariadb-client openrc libc6-compat && apk add --no-cache supervisor && openrc reboot
COPY srcs/mariadb-server.cnf /etc/my.cnf.d/
COPY srcs/config-sql.sh /home/
COPY srcs/phpmyadmin.sql /home/
COPY srcs/wordpress.sql /home/
RUN chmod +x /home/config-sql.sh

#Setup superviseurd
COPY srcs/supervisord.conf /etc/supervisord.conf

#Setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz .
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 tele
COPY srcs/telegraf.conf /home/

EXPOSE 3306
CMD sh /home/config-sql.sh