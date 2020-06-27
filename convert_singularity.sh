#!/bin/bash

MY_IP="192.168.1.123:5000"
COMPOSEFILES=`ls compose`

for i in $COMPOSEFILES
do
  for IMG in $(docker-compose -f compose/$i config | grep -oP -e "(?<=\s)[^\s]+-[0-9]\.[0-9]\.[0-9]")
  do
    echo $IMG
    #echo singularity build singularityfiles/$IMG.sif docker-daemon://$MY_IP/mattocci/${IMG/-/:}
  done
done
