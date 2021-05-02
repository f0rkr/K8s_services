FROM alpine:latest

WORKDIR /home/
RUN apk update && apk add vsftpd openrc openssl libc6-compat bash && apk add --no-cache supervisor && openrc reboot
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=US/ST=US/L=Texas/O=42/CN=127.0.0.1" -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt 
RUN adduser admin -D && echo "admin:admin" |chpasswd
RUN mkdir -p /home/admin/ftp/upload
RUN chmod 550 /home/admin/ftp && chmod 750 /home/admin/ftp/upload && chown -R admin: /home/admin/ftp/
COPY srcs/vsftpd.conf /etc/vsftpd/

#Setup superviseurd
COPY srcs/supervisord.conf /etc/supervisord.conf

#Setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz .
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 tele
COPY srcs/telegraf.conf /home/
EXPOSE 21
CMD /usr/bin/supervisord -c /etc/supervisord.conf 