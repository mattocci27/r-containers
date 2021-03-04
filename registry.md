
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
  -e ENV_DOCKER_REGISTRY_HOST=210.72.93.96 \
  -e ENV_DOCKER_REGISTRY_PORT=5000 \
  -p 8080:80 konradkleine/docker-registry-frontend:v2

```

```
docker run -d --name sql_server_demo -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=really

05da2b6d44f4

docker container rm $(docker container ls -aq | rg -v 05da2b6d44f4)



```
