#!/bin/bash

LATEST_TAG="4.0.0"
MY_IP="192.168.1.123:5000"
COMPOSEFILES=`ls compose`

for IMG in r-ver rstudio tidyverse verse
do
    for VER in 3.6.3 4.0.0 latest
    do
        docker pull rocker/$IMG:$VER
        docker tag rocker/$IMG:$VER $MY_IP/rocker/$IMG:$VER
        docker push $MY_IP/rocker/$IMG:$VER
    done
done
