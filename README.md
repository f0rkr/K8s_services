# K8s_services
<center><img src='https://camo.githubusercontent.com/6171898673c3f84e17e032036cd659446bf105ce6d2923e97a13b4bf3c5d6b4f/68747470733a2f2f64333377756272666b69306c36382e636c6f756466726f6e742e6e65742f656234653431663263626130636263386431313966386430656232626436393335636237386663382f62613764362f696d616765732f636f6d6d756e6974792f6b756265726e657465732d636f6d6d756e6974792d66696e616c2d30322e6a7067'/></center>

☸️: Kubernetes cheat sheet

```bash
# Create a pod from a YAML file
kubectl create -f <yourfile.yaml>

# Delete a pod
kubectl delete deployment <your deployment>
kubectl delete service <your service>
# and so on if you have different objects

# Get a shell in a pod
# First get the pod full name with:
kubectl get pods
# Then, your pod name should look like "grafana-5bbf569f68-svdnz"
kubectl exec -it <pod name> -- /bin/sh

# Copy data to pod or to our computer
kubectl cp <pod name>:<file> <to>
# or vice versa
kubectl cp <from> <pod name>:<to>

# Restart a deployment
kubectl rollout restart deployment <name>

# Launch minikube dashboard
minikube dashboard

# Get cluster external IP
minikube ip

# Reset Minikube VM
minikube delete
```
🐳: Docker cheat sheet

```bash
# Build a docker image from a Dockerfile
docker build -t <your image name> <your Dockerfile dir>

# Start an instance of a docker image
docker run -it <your image name>
# Really important if you want to bind some ports on the container 
# to your own computer, use -p option.
# Exemple for an Apache image using port 80 in the container as our port 80
docker run -it debian:apache -p80:80

# See all images
docker images

# See running containers
docker ps

# Stop a container
docker kill <container ID>

# Delete all unused Docker images and cache and free SO MUCH SPACE on 
# your computer
docker system prune
```

## Containers 🔥

### Nginx
Nginx is a web server that can provide web pages and execute PHP (a language for web backend). You need to create a simple Nginx server, it has to be fetchable through Ingres, which is a more advanced version of service. Port 443 is for SSL connection (https). You can create a SSL certificate with Openssl.
This container needs to provide a SSH connection. SSH is used to access a computer remotly through a shell.
A really simple way to create a SSH server is through the openssh package and then run the sshd daemon.

### FTPs
A simple FTPs server. FTP is a protocol to send and download files from a distant computer. FTPs is a version that uses SSL to encrypt communications between the client and the server, which is safer. Pure-FTPD is a simple FTP server.
You can test a FTP connection with:
```sh
ftp <user>@<ip>
```

### Wordpress
Wordpress is the #1 open source website and blog content manager. It's written in PHP, and uses MySQL as database. MySQL is the most used SQL database, SQL is a language to query data.
You'll need to use a web server, you can reuse Nginx.
Your wordpress database (you'll need to import it in MySQL) contains the website IP information, which has to match the IP you access it from. You'll need to input the Minikube IP to the wordpress SQL database. Wordpress also has a wp-config.php file that you'll need to edit so it can access your MySQL service.

You can test a remote MySQL connection with:
```sh
# -p only if your user has a password
mysql <database name> -u <user> -p -h <ip>
```

### PHPMyAdmin
PHPMyAdmin is a useful tool to view, query, and edit data from a MySQL database. It can be hosted by any web server, so I recommand you to use Nginx as well as you've used it before. You need to edit phpmyadmin.inc.php file to connect to your MySQL service.

### Grafana
Grafana is a web dashboard used to visualize data, like a cluster health. It can automatically fetch data from various sources, but we'll use InfluxDB, which is a database engine.

You can test an InfluxDB connection by fecthing /ping endpoint:
```sh
curl http://influxdb:8086/ping
curl http://192.168.0.29/ping
```

We'll send all container data (CPU usage, memory, processes) easily by using Telegraf. It's a simple program that sends system data to an InfluxDB instance.

So our stack is:
Telegraf --> InfluxDB --> Grafana
Get data     Store data   Visualize Data

So there are two connections to configure, Telegraf to InfluxDB which is done in the /etc/telegraf/telegraf.conf file and the Grafana to InfluxDB which is done from the Grafana web interface.

To provide an already-configured version of Grafana, I advise you to setup a blank Grafana setup, launch you container, configure everything. Then save the grafana.db file on your computer (you can use "kubectl cp" to get data from a running pod). You can now copy this file in your Dockerfile.

**Setting up Metallb LoadBalancer:**

- To install MetalLB, apply the manifest:

    ```bash
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
    # On first install only
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    ```

    ---

- Then chose type of configuration from here:

    [MetalLB, bare metal load-balancer for Kubernetes](https://metallb.universe.tf/configuration/)

