#!/bin/bash
set -e

apt update && apt install -y python3-pip \
  curl \
  lib32stdc++6 \
  ghostscript \
  libpoppler-cpp-dev \
  libtesseract-dev \
  libleptonica-dev \
  cargo \
  libwebp-dev \
  tesseract-ocr-eng \
  gdal-bin \
  proj-bin \
  libgdal-dev \
  libproj-dev \
  libavfilter-dev \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*

pip3 install --default-timeout=100 -U radian

cp /scripts/.radian_profile /home/rstudio/.radian_profile

install2.r -n -1 --skipinstalled --error \
  --deps TRUE \
    kableExtra \
    magick \
    webshot

Rscript -e "webshot::install_phantomjs()"
