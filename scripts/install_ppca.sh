#!/bin/bash
set -e

installGithub.r \
  --repos https://mirror.lzu.edu.cn/CRAN \
  jinyizju/V.PhyloMaker

install2.r -n -1 --skipinstalled --error \
  --deps TRUE \
  --repos https://mirror.lzu.edu.cn/CRAN \
  adephylo \
  factoextra \
  phylobase \
  phytnols \
  picante \
  smatr \
  caper

rm -rf /tmp/downloaded_packages/ /tmp/*.rds
