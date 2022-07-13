#!/bin/bash
LATEST_TAG=$1
MY_IP=$2


for IMG in $(docker-compose config | grep -oP -e "(?<=\s)[^\s]+:[0-9]\.[0-9]\.[0-9]") rocker/rstudio:$LATEST_TAG
    do
        # push to docker registory without latest tag
        docker pull $IMG
        docker tag $IMG $MY_IP/$IMG
        docker push $MY_IP/$IMG
    if [[ $IMG =~ $LATEST_TAG ]]; then
        IMG_LATEST=${IMG//$LATEST_TAG/latest}
        # push to docker registory with latest tag
        docker tag $IMG $MY_IP/$IMG_LATEST
        docker push $MY_IP/$IMG_LATEST
    fi
    done
