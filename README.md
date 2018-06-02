# docker-lirc

Run
```
docker run -d \
  --name=lirc \
  --device=/dev/lirc0:/dev/lirc0:rwm \
  -v /opt/lirc:/etc/lirc \
  -v /opt/lirc/config.json:/usr/local/lib/node_modules/lirc_web/config.json:ro \
  -p 3000:3000 \
  kmlucy/docker-lirc
```

Based on [LIRC](http://www.lirc.org/) and [alexbain/lirc_web](https://github.com/alexbain/lirc_web)
