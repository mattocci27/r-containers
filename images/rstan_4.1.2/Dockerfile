# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/geospatial:4.1.2


ENV DEBIAN_FRONTEND noninteractive








RUN install2.r -n -2 --skipinstalled --error \
    RcppParallel \
    rstan \
    rstanarm \
  && rm -rf /tmp/downloaded_packages


RUN installGithub.r \
      stan-dev/cmdstanr

RUN mkdir -p  /opt/cmdstan \
 && Rscript -e "cmdstanr::install_cmdstan(dir = '/opt/cmdstan', release_url = 'https://github.com/stan-dev/cmdstan/releases/download/v2.29.0/cmdstan-2.29.0.tar.gz', cores = 2, timeout = 2400)"

