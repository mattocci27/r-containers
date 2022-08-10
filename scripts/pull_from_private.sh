#!/bin/bash
IMG_TAG=$1
LATEST_TAG=$2
MY_IP=$3

for IMG in mattocci/radian:$IMG_TAG mattocci/radian-verse:$IMG_TAG mattocci/tinytex:$IMG_TAG rocker/rstudio:$IMG_TAG rocker/geospatial:$IMG_TAG
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
