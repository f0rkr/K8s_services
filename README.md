# K8s_services
<center><img src='https://camo.githubusercontent.com/6171898673c3f84e17e032036cd659446bf105ce6d2923e97a13b4bf3c5d6b4f/68747470733a2f2f64333377756272666b69306c36382e636c6f756466726f6e742e6e65742f656234653431663263626130636263386431313966386430656232626436393335636237386663382f62613764362f696d616765732f636f6d6d756e6974792f6b756265726e657465732d636f6d6d756e6974792d66696e616c2d30322e6a7067'/></center>

K8s services consists of implementing and building an infrastructure with different services using kubernetes.


# Containers:
- ```MetalLB```: Is a Load Balancer that manages external access to its services. It is the only entrance to the cluster.

- ```Nginx```: Is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server.

- ```vsFTPd```: [very secure FTP daemon] Is an FTP server for Unix-like system, including Linux.

- ```MariaDB```: Is a database management system derived from MySQL with a GPL (General Public License).

- ```Wordpress```: Is a CMS(Content Managament System) focused on the creation of any type of web page.

- ```phpMyAdmin```: Is a free software tool intended to handle the administration of MySQL over the web.

- ```InfluxDB```: Is a open-source time series database developed by InfluxData

- ```Telegraf```: Is the open-source server agent to help you collect metrics from your stacks, sensors and systems.

- ```Grafana```: Is a open-source graphing and analisys software. Allows you to query, view, alert, and explore your metrics from Time Series Database Storage(TSDB)

# Installation 👾

Feel free to use my script to install all required software to set you up:

[k8s Session setup](https://github.com/f0rkr/k8s-42-session-setup)

```
# Use the setup.sh script to build the docker images and deploye kubernetes.
f0rkr@shell$ chmod +x start.sh
f0rkr@shell$ ./start.sh 
```

# Resources:
   - *I made a notion documentation for this project check it out:* [notion](https://www.notion.so/Docker-k8s-resources-5d89599a520b479e8f18487aa3e537a3)
   - Dockerfile reference - [Docker Documentation](https://docs.docker.com/engine/reference/builder/)
   - Welcome! | minikube - [minikube documentation](https://minikube.sigs.k8s.io/docs/)
   - Index of /alpine/ - [Alpine Linux](https://dl-cdn.alpinelinux.org/alpine/)
   - MetalLB - [Configuration](https://metallb.universe.tf/configuration/)
   - MetalLB - [Usage](https://metallb.universe.tf/usage/)
   - Installing MariaDB - [MariaDB](https://mariadb.com/kb/en/getting-installing-and-upgrading-mariadb/)
   - PHP Manual - [Command line usage](https://www.php.net/manual/en/features.commandline.options.php)
   - Manpage of vsFTPd.conf - [vsFTPd.conf](http://vsftpd.beasts.org/vsftpd_conf.html)
   - InfluxData Documentation - [InfluxData](https://docs.influxdata.com/)
   - Grafana Documentation - [Grafana Labs](https://grafana.com/docs/grafana/latest/)
   - Schema ft_services - [AdrianWR](https://github.com/AdrianWR/ft_services/blob/master/srcs/ft_services.png)
   - Schema kubernetes - [GuillaumeOz](https://github.com/GuillaumeOz/42_Ft_services/blob/master/assets/schema_ft_services.jpg)
   - YAML Object Reference - [GuillaumeOz](https://github.com/GuillaumeOz/42_Ft_services/blob/master/doc/yaml_files.md)
   - Tips for defending - [ft_services on a VM](https://www.notion.so/Ft_services-VM-852d4f9b0d9a42c1a2de921e4a2ac417)
