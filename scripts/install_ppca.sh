#!/bin/bash
set -e


installGithub.r helixcn/plantlist
installGithub.r husson/FactoMineR
installGithub.r jinyizju/V.PhyloMaker

install2.r -n -1 --skipinstalled --error \
  --deps TRUE \
  adephylo \
  factoextra \
  phylobase \
  phytools \
  picante \
  rgl \
  smatr \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
