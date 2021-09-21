# docker-lirc

Run
```
docker run -d \
  --name=lirc \
  --device=/dev/lirc0:/dev/lirc0:rwm \
  -v /opt/lirc:/etc/lirc \
  -p 8765:8765 \
  ghcr.io/kmlucy/docker-lirc
```

Based on [LIRC](http://www.lirc.org/)
