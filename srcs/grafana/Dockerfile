FROM alpine

WORKDIR /home/
RUN apk update && apk add --no-cache libc6-compat && apk add --no-cache supervisor 
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.1.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.3.1.linux-amd64.tar.gz
COPY srcs/grafana.db /home/grafana-7.3.1/data/

#Setup superviseurd
COPY srcs/supervisord.conf /etc/supervisord.conf

#Setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz .
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 tele
COPY srcs/telegraf.conf /home/

EXPOSE 3000
CMD /usr/bin/supervisord -c /etc/supervisord.conf 