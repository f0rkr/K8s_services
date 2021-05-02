#!/bin/zsh

minikube docker-env
eval $(minikube -p minikube docker-env)

# sed -i '' "s/minikubeip/192.168.2/g" srcs/nginx/srcs/default.conf

#Building images
docker build srcs/influxdb -t influxdb
docker build srcs/grafana -t grafana
docker build srcs/mysql -t mysql
docker build srcs/phpmyadmin -t phpmyadmin
docker build srcs/wordpress -t wordpress
docker build srcs/ftps -t ftps
docker build srcs/nginx -t nginx

#Configuring metallb namespace and create secret key
kubectl apply  -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

#Applying config file
kubectl apply -f srcs/yamls

minikube dashboard