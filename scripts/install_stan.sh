#!/bin/bash
set -e

install2.r -n 4 --error \
  --deps TRUE \
  RcppParallel \
  rstanarm 

rm -rf /tmp/downloaded_packages/ /tmp/*.rds
