#!/bin/bash

make

bash ./push.sh

rm singulairtyfiles/*
python3 get_imgs.py
