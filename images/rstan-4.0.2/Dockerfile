# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/geospatial:4.0.2







RUN install2.r -n -1 --skipinstalled --error \
  --deps TRUE \
    RcppParallel \
    rstan \
  && rm -rf /tmp/downloaded_packages
