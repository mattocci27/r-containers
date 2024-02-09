# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/geospatial:4.3.2


ENV DEBIAN_FRONTEND noninteractive











RUN install2.r -n -2 --skipinstalled --error \
    RcppParallel \
    rstan \
    rstanarm \
  && rm -rf /tmp/downloaded_packages


ENV CMDSTAN_VERSION=

RUN R -e 'install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))''

RUN mkdir -p  /opt/cmdstan \
 && Rscript -e "cmdstanr::install_cmdstan(dir = '/opt/cmdstan', release_url = 'https://github.com/stan-dev/cmdstan/releases/download/v${CMDSTAN_VERSION}/cmdstan-${CMDSTAN_VERSION}.tar.gz', cores = 2, timeout = 3600)"

