# Node-RED
#
# Version 0.0.1

FROM alpine:3.1
MAINTAINER James Brink, brink.james@gmail.com
LABEL version="0.0.1"
LABEL description="Node-RED"

# Install needed packages
RUN apk update \
      && apk add nodejs make gcc g++ python \
      && npm -g install npm@latest-2 \
      && npm install -g --unsafe-perm node-red

# Create node-red user, group and app diectory
RUN addgroup node-red \
      && adduser -h /home/node-red -s /bin/sh -D -G node-red node-red \
      && mkdir /data \
      && chown -R node-red:node-red /data

USER node-red
VOLUME ["/data"]
EXPOSE 1880

CMD ["/usr/bin/node-red", "--userDir", "/data", "-v"]
