#!/bin/sh
set -e

docker save rocker/tidyverse > rocker_tidyverse_3.6.3.tar
docker save rocker/verse > rocker_verse_3.6.3.tar
docker save mattocci/ppca > mattocci_ppca_3.6.3.tar
docker save mattocci/rstan > mattocci_rstan_3.6.3.tar
docker save mattocci/myenv > mattocci_myenv_3.6.3.tar
docker save mattocci/rmd > mattocci_rmd_3.6.3.tar

cp_files() {
  #array=`find ./ | grep "\.tar$" | sed 's/^\.\///g'`
  array=`find ./ | grep "\.tar$"`
  for f in $array
  do
    echo $f
   # mv $f ${HOME}/docker-images/${f}
  done
}

cp_files
