# Node-RED
#
# Version  latest

FROM node:6-alpine
MAINTAINER James Brink, brink.james@gmail.com
LABEL version="latest"
LABEL description="Node-RED"

# Create node-red user, directories and source code.
RUN addgroup node-red \
	&& adduser -h /home/node-red -s /bin/sh -D -G node-red node-red \
	&& mkdir /data \
	&& apk update \
	&& apk add --no-cache \
		python \
		udev \
		libusb \
		git \
		make \
		gcc \
		g++ \
		libusb-dev \
		icu-dev \
		eudev-dev \
		linux-headers \
	&& cd /home/node-red/ \
	&& git clone https://github.com/node-red/node-red.git /home/node-red/ \
	&& git checkout HEAD \
	&& npm install --build-from-source \
		sentiment \
		wordpos \
		xml2js \
		pi-gpio \
		firmata \
		fs.notify \
		serialport \
		ntwitter \
		feedparser \
		growl \
		node-prowl \
		pushbullet \
		nodemailer \
		imap \
		irc \
		simple-xmpp \
		redis \
		mongodb \
		level \
		eyes \
	&& npm install --unsafe-perm \
	&& npm run build \
	&& npm cache clean \
	&& apk del git make gcc g++ libusb-dev icu-dev eudev-dev linux-headers \
	&& chown -R node-red:node-red /data /home/node-red
	
WORKDIR /home/node-red/
USER node-red
VOLUME ["/data"]
EXPOSE 1880

CMD ["/usr/local/bin/node", "red.js", "--userDir", "/data", "-v"]