#!/bin/bash
LATEST_TAG=$1

# push to dockerhub without latest tag
docker-compose push

for IMG in $(docker-compose config | grep -oP -e "(?<=\s)[^\s]+:[0-9]\.[0-9]\.[0-9]")
    do
    if [[ $IMG =~ $LATEST_TAG ]]; then
        IMG_LATEST=${IMG//$LATEST_TAG/latest}
        # push to dockerhub with latest tag
        docker tag $IMG $IMG_LATEST
        docker push $IMG_LATEST
    fi
    done
