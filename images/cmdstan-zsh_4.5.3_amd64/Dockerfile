# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
ARG BASE_IMAGE=mattocci/radian-zsh:4.5.3_amd64
FROM ${BASE_IMAGE}
USER root


ENV DEBIAN_FRONTEND=noninteractive
ENV CRAN_REPO=https://packagemanager.posit.co/cran/__linux__/noble/2026-04-15
ENV RCPP_REPO=https://rcppcore.r-universe.dev
ENV CTAN_REPO=https://texlive.info/tlnet-archive/2026/04/15/tlnet

# Debug output to confirm TARGETPLATFORM (optional)
ARG TARGETPLATFORM
RUN echo "TARGETPLATFORM: ${TARGETPLATFORM}"

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    build-essential \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*











ENV CMDSTAN_VERSION=2.38.0
ENV CMDSTANR_REF=v0.9.0

RUN R -e "remotes::install_github('stan-dev/cmdstanr@${CMDSTANR_REF}', upgrade = 'never')"

RUN mkdir -p  /opt/cmdstan \
 && Rscript -e "cmdstanr::install_cmdstan(dir = '/opt/cmdstan', release_url = 'https://github.com/stan-dev/cmdstan/releases/download/v${CMDSTAN_VERSION}/cmdstan-${CMDSTAN_VERSION}.tar.gz', cores = 2, timeout = 3600)"

ENV CMDSTAN_PATH=/opt/cmdstan/cmdstan-${CMDSTAN_VERSION}




USER rstudio