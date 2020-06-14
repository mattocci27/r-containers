docker image ls | grep mattocci

sudo docker container stop $(sudo docker container ls -a -q)
sudo docker container rm $(sudo docker container ls -a -q)

sudo docker image rm $(sudo docker image ls | grep "^<none>" | awk '{print $3}')

docker image rm $(docker image ls  | grep mattocci | grep 210 | awk '{print $3}')


docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc)
docker image rm $(docker image ls  | grep mattocci | grep 3.6.3 | awk '{print $3}')

docker run -p 8888:8888 --rm jupyter/datascience-notebook