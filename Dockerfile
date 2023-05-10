FROM debian:buster
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

RUN apt-get update -q && \
	apt-get install -y lirc --no-install-recommends && \
	apt-get install -y curl supervisor python-toposort && \
	apt-get clean && \
	rm -rf /var/lib/apt-lists/* /tmp/* /var/tmp/ && \
	mkdir /var/run/lirc && touch /var/run/lirc/lircd.pid && \
	curl -O https://raw.githubusercontent.com/bendikro/supervisord-dependent-startup/master/supervisord_dependent_startup/supervisord_dependent_startup.py && \
	chmod +x /supervisord_dependent_startup.py

ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD lircd.conf /etc/supervisor/conf.d/lircd.conf
ADD irexec.conf /etc/supervisor/conf.d/irexec.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

EXPOSE 8765
