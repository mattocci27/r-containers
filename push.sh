#!/bin/bash
LATEST_TAG="4.0.5"
MY_IP="210.72.93.96:5000"

# push to dockerhub without latest tag
docker-compose push

for IMG in $(docker-compose config | grep -oP -e "(?<=\s)[^\s]+:[0-9]\.[0-9]\.[0-9]")
    do
        # push to docker registory without latest tag
       # docker tag $IMG $MY_IP/$IMG
       # docker push $MY_IP/$IMG
    if [[ $IMG =~ $LATEST_TAG ]]; then
        IMG_LATEST=${IMG//$LATEST_TAG/latest}
        # push to dockerhub with latest tag
        docker tag $IMG $IMG_LATEST
        docker push $IMG_LATEST
        # push to docker registory with latest tag
       # docker tag $IMG $MY_IP/$IMG_LATEST
       # docker push $MY_IP/$IMG_LATEST
    fi
    done
