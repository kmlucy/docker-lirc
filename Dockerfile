FROM debian:stretch
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

RUN apt-get update -q && \
	apt-get install -y lirc --no-install-recommends && \
	apt-get clean && \
	rm -rf /var/lib/apt-lists/* /tmp/* /var/tmp/ && \
	mkdir /var/run/lirc && touch /var/run/lirc/lircd.pid

CMD ["lircd"]

EXPOSE 8765
