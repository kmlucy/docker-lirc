FROM node:stretch
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

RUN apt-get update -q && \
	apt-get install -y lirc supervisor --no-install-recommends && \
	apt-get clean && \
	rm -rf /var/lib/apt-lists/* /tmp/* /var/tmp/ && \
	mkdir /var/run/lirc && touch /var/run/lirc/lircd.pid && \
	npm install -g lirc_web && \
	npm cache clean --force

ADD *.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord", "-n"]

EXPOSE 3000
