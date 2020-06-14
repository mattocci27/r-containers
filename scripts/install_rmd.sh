#!/bin/bash
set -e

apt update && apt install -y python3-pip

pip3 install --default-timeout=100 -U radian

cp /scripts/.radian_profile /home/rstudio/.radian_profile

install2.r -n -1 --skipinstalled --error \
    kableExtra \
    magick \
    webshot

Rscript -e "webshot::install_phantomjs()"