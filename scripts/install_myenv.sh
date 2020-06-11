#!/bin/bash
set -e

apt update && apt install -y --fix-missing python3-pip \
  curl \
  libudunits2-dev \
  libgl1-mesa-dev \
  libglu1-mesa-dev \
  libgdal-dev \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*

pip3 install --default-timeout=100 -U radian

cp /scripts/.radian_profile /home/rstudio/.radian_profile

install2.r -n 4 --error \
    --deps TRUE \
    vegan \
    MuMIn \
    furrr \
    tictoc \
    snowfall \
    sads \
    ggthemes \
    blogdown \
    kableExtra \
    picante \
    provenance \
    ggrepel \
    languageserver \
    png \
    pander \
    memisc \
    mvtnorm \
    adespatial \
    GGally \
    hexbin \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
