#!/bin/bash

LATEST_TAG="4.0.0"
MY_IP="192.168.1.123:5000"
COMPOSEFILES=`ls compose`

for i in $COMPOSEFILES
do
    # push to dockerhub without latest tag
	docker-compose -f compose/$i push

    for IMG in $(docker-compose -f compose/$i config | grep -oP -e "(?<=\s)[^\s]+:[0-9]\.[0-9]\.[0-9]")
        do
            # push to docker registory without latest tag
            docker tag $IMG $MY_IP/$IMG
            docker push $MY_IP/$IMG
        if [[ $IMG =~ $LATEST_TAG ]]; then
            IMG_LATEST=${IMG//$LATEST_TAG/latest}
           # push to dockerhub with latest tag
            docker tag $IMG $IMG_LATEST
            docker push $IMG_LATEST
           # push to docker registory with latest tag
            docker tag $IMG $MY_IP/$IMG_LATEST
            docker push $MY_IP/$IMG_LATEST
        fi
        done
done