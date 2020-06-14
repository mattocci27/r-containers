dockerfiles

docker-compose -f compose/r-3.6.3.yml build

docker build --no-cache -t test .

docker run -it --rm -v $(pwd):/home/rstudio/test -u rstudio rocker/rstudio /bin/bash

```/etc/systemd/resolved.conf
[Resolve]
DNS=8.8.8.8 8.8.4.4
```

```
systemctl restart systemd-resolved
```
