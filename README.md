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

```
Rscript make-dockerfiles.R
Rscript write-compose.R
```

```

docker tag mattocci/rstan:4.0.0 localhost:5000/mattocci/rstan:4.0.0
docker push localhost:5000/mattocci/rstan:4.0.0

docker tag mattocci/rstan:4.0.0 192.168.1.123:5000/mattocci/rstan:4.0.0
docker push 192.168.1.123:5000/mattocci/rstan:4.0.0

docker pull mattocci/rstan:4.0.0

docker login -u mattocci 192.168.1.123:5000 

docker run -d \
  --restart=always \
  --name registry \
  -v "$(pwd)"/certs:/certs \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
  -p 443:443 \
  registry:2

docker tag ztpln 192.168.1.123:5000/ztpln
docker push 192.168.1.123:5000/ztpln

docker pull 192.168.1.123:5000/ztpln

sudo mkdir -p /etc/docker/certs.d/192.168.1.123:443
cd certs
sudo cp certs/domain.crt /etc/docker/certs.d/192.168.1.123:443/ca.crt

sudo cp certs/domain.crt /etc/docker/certs.d/192.168.1.123:5000/
cd /etc/docker/certs.d/192.168.1.123:5000/
mv domains.crt ca.crt

```
