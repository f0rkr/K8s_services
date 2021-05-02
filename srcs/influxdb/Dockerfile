FROM alpine

WORKDIR /home/
RUN apk update && apk add --no-cache supervisor && apk add --no-cache  libc6-compat && apk add --no-cache --upgrade bash && apk add influxdb 

#Setup superviseurd
COPY srcs/supervisord.conf /etc/supervisord.conf

#Setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz .
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 tele
COPY srcs/telegraf.conf /home/

EXPOSE 8086
CMD /usr/bin/supervisord -c /etc/supervisord.conf
