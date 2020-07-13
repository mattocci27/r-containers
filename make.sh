#!/usr/bin/env bash

python3 update.py

docker-compose build

bash push.sh

rm singularity/*
python3 docker_to_sing.py