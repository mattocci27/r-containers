#!/bin/bash

make

bash ./push.sh

bash ./convert_singularity.sh
