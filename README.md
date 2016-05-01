# Docker Container for Node-RED
---
This is a Docker container for [Node-RED](http://nodered.org/). The Goal of this container is to create a customizable yet easy to use instance of Node-RED while maintaining a small footprint.

## Usage
---
To run with default settings:

```shell
docker run -P jamesbrink/node-red
```

This will run Node-RED exposing it on a randomly generated TCP port.

For example, I can run `docker ps` and see my container started up and mapped the exposed port for Node-RED to `32770`.

```shell
mbp:~$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS              PORTS                     NAMES
a5de1eac9387        node-red            "/usr/bin/node-red --"   About a minute ago   Up About a minute   0.0.0.0:32770->1880/tcp   stupefied_roentgen
```

Because I am running using [docker-machine](https://docs.docker.com/machine/overview/), I need to also obtain the virtual machine's IP address to access Node-RED.

```shell
mbp:~$ docker-machine ip docker
192.168.32.145
```

A quick `curl` to the docker-machine IP address and we can see a response from the container

```shell
mbp:~$ curl -I 192.168.32.145:32770
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 8300
ETag: W/"206c-owtn/uuHF9+H9sd4KcnyVQ"
Date: Sun, 01 May 2016 01:13:17 GMT
Connection: keep-alive
```


## Data Volumes
---
The following directories are setup as volumes, and can be access from other containers.

* `/data` - This is where Node-RED configuration data and flows reside.
