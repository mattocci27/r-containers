#!/usr/bin/env bash

python3 update.py

docker-compose build

bash push.sh

rm -f singularity/*
python3 docker_to_sing.py 210.72.93.96:5000
