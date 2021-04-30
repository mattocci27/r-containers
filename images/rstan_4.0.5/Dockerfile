# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/geospatial:4.0.5


ENV DEBIAN_FRONTEND noninteractive







RUN install2.r -n -2 --skipinstalled --error \
    RcppParallel \
    rstan \
    rstanarm \
  && rm -rf /tmp/downloaded_packages
