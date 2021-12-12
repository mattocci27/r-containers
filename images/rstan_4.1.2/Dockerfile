# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/geospatial:4.1.2


ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    gosu \
  && apt-get autoremove -y \
  && apt-get clean all






RUN install2.r -n -2 --skipinstalled --error \
    RcppParallel \
    rstan \
    rstanarm \
  && rm -rf /tmp/downloaded_packages


