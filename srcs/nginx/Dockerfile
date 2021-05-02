FROM alpine

WORKDIR /home/

#Insatlling and UPdating Packages
RUN apk update && apk add sudo openrc nginx openssh libc6-compat bash && apk add --no-cache supervisor
RUN openrc reboot && rc-update add nginx default && rc-update add sshd default

#Setup Nginx
ADD srcs /home/src
RUN adduser -g 'Nginx www user' --disabled-password -h /home/www/ mashad && echo "mashad:mashad" | chpasswd && chown -R mashad:mashad /home/www && chown -R mashad:mashad /var/lib/nginx
RUN echo "%mashad ALL=(ALL) ALL" >>/etc/sudoers
RUN mkdir /run/nginx
RUN echo "It's working" > /home/www/index.html
COPY srcs/default.conf /etc/nginx/conf.d/
COPY srcs/ssl /etc/nginx/ssl/
RUN ssh-keygen -A

#Setup superviseurd
COPY srcs/supervisord.conf /etc/supervisord.conf

#Setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz .
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 tele
COPY srcs/telegraf.conf /home/

EXPOSE 80 443 22
CMD /usr/bin/supervisord -c /etc/supervisord.conf