sudo docker container stop $(sudo docker container ls -a -q)

sudo docker image rm -f $(sudo docker image ls | grep "^<none>" | awk '{print $3}')
sudo docker image rm -f $(sudo docker image ls | grep 192.168.1.123 | awk '{print $3}')

docker image rm -f $(docker image ls  | grep mattocci awk '{print $3}')


docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc)
docker image rm $(docker image ls  | grep mattocci | grep 3.6.3 | awk '{print $3}')

docker container stop $(sudo docker container ls -a | awk '{print $1}' | head -3)

singularity sign singularity/rstan_3.6.3.sif

singularity push -U singularity/rstan_3.6.3.sif library://mattocci27/default/rstan:3.6.3

time singularity push -U hoge.sif library://mattocci27/default/rstan:3.6.3

sudo time singularity build hoge.sif images/rmd-crossref_4.0.2/Singularity.def
sudo time singularity build hoge.sif images/rmd-crossref_4.0.2/Singularity.def
sudo time singularity build hoge.sif images/rmd-crossref_4.0.2/Singularity.def
sudo time singularity build hoge.sif images/rmd-crossref_4.0.2/Singularity.def

sudo time singularity build hoge.sif images/rmd-crossref_4.0.5/Singularity.def


docker run -it --rm -v $(pwd):/home/rstudio/Russo2021 \
  mattocci/rmd-crossref:4.0.5 /bin/bash

docker run -it --rm -v $(pwd):/home/rstudio/Russo2021 \
  rocker/r-ver /bin/bash

singularity push -U alpine_3.sif library://mattocci27/default/rstan:3.6.3

docker build --no-cache --add-host="api.github.com:140.82.112.5" -t mattocci/rmd-crossref:4.0.5 ./images/rmd-crossref_4.0.5 
docker build --no-cache  -t mattocci/rmd-crossref:4.0.5 ./images/rmd-crossref_4.0.5 

docker build -t mattocci/rmd-crossref:4.0.5 ./images/rmd-crossref_4.0.5 

docker build -t mattocci/rmd-light:4.0.5 ./images/rmd-light_4.0.5 

docker run -d  \
  --name r-filebrowser \
  -v $(pwd):/home/rstudio/mattocci \
  -p 8787:8787 \
  -e PASSWORD=F85hPRItkcsaQ7lR6AHK \
  rocker/rstudio:4.0.3

docker run \
  -d \
  --name registry-frontend \
  --hostname registry-frontend \
  --restart on-failure:10 \
  -e ENV_DOCKER_REGISTRY_HOST=210.72.93.96 \
  -e ENV_DOCKER_REGISTRY_PORT=5000 \
  -p 8080:80 konradkleine/docker-registry-frontend:v2
