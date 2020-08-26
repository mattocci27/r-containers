sudo docker container stop $(sudo docker container ls -a -q)

sudo docker image rm $(sudo docker image ls | grep "^<none>" | awk '{print $3}')
sudo docker image rm $(sudo docker image ls | grep 192.168.1.123 | awk '{print $3}')

docker image rm $(docker image ls  | grep mattocci | grep 210 | awk '{print $3}')


docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc)
docker image rm $(docker image ls  | grep mattocci | grep 3.6.3 | awk '{print $3}')

docker container stop $(sudo docker container ls -a | awk '{print $1}' | head -3)
