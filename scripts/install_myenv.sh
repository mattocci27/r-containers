#!/bin/bash
set -e

apt update && apt install -y --fix-missing python3-pip \
  curl \
  libudunits2-dev \
  libgl1-mesa-dev \
  libglu1-mesa-dev \
  libgdal-dev \
  libharfbuzz0b \
  libudunits2-dev \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*

pip3 install --default-timeout=100 -U radian

cp /scripts/.radian_profile /home/rstudio/.radian_profile

Rscript -e "install.packages('BiocManager')"
Rscript -e "BiocManager::install(c('marray', 'affy', 'Biobase'))"

install2.r -n -1 --skipinstalled --error \
  --deps TRUE \
  adespatial \
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
  GGally \
  hexbin \
  corrplot \
  FactoMineR \
  factoextra

 rm -rf /tmp/downloaded_packages/ /tmp/*.rds

  #freetypeharfbuzz \
  #vdiffr \
