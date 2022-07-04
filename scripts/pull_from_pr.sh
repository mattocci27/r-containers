#!/bin/bash
LATEST_TAG=$1
MY_IP=$2

for IMG in mattocci/radian:4.2.1 mattocci/tinytex:4.2.1 mattocci/radian-ml:4.2.1
#for IMG in $(docker-compose config | grep -oP -e "(?<=\s)[^\s]+:[0-9]\.[0-9]\.[0-9]")
    do
        docker pull $MY_IP/$IMG
        docker tag $MY_IP/$IMG $IMG
        docker image rm $MY_IP/$IMG
    if [[ $IMG =~ $LATEST_TAG ]]; then
        IMG_LATEST=${IMG//$LATEST_TAG/latest}
        # push to docker registory with latest tag
        docker tag $IMG $IMG_LATEST
    fi
    done