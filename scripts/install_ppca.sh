#!/bin/bash
set -e

install2.r --error Rcpp
installGithub.r husson/FactoMineR

install2.r -n -1 --skipinstalled --error \
  --deps TRUE \
  adephylo \
  factoextra \
  phylobase \
  phytools \
  picante \
  rgl \
  smatr

rm -rf /tmp/downloaded_packages/ /tmp/*.rds
