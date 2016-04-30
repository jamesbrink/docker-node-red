# Node-RED
#
# Version 0.0.1

FROM alpine:3.1
MAINTAINER James Brink, brink.james@gmail.com
LABEL version="0.0.1"
LABEL description="Node-RED"

RUN apk update \
      && apk add nodejs make gcc g++ python \
      && npm -g install npm@latest-2 \
      && npm install -g --unsafe-perm node-red

EXPOSE 80
CMD ["/usr/bin/node-red", "-p", "80", "-v"]
