
```
docker run -d -p 5000:5000 --name registry \
  --hostname registry --restart on-failure:10 \
  -v /var/local/volume:/var/lib/registry \
  registry:2
```

```
docker run \
  -d \
  --name registry-frontend \
  --hostname registry-frontend \
  --restart on-failure:10 \
  -e ENV_DOCKER_REGISTRY_HOST=192.168.1.123 \
  -e ENV_DOCKER_REGISTRY_PORT=5000 \
  -p 8080:80 konradkleine/docker-registry-frontend:v2

```

