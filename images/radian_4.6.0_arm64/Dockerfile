# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
ARG BASE_IMAGE=rocker/rstudio:4.6.0
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
    libcairo2-dev \
    libcurl4-openssl-dev \
    libglpk-dev \
    libssl-dev \
    libxml2-dev \
    libzmq3-dev \
    pkg-config \
    zlib1g-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libgit2-dev \
    python3-venv \
    python3-dev \
    cmake \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*





RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --no-cache-dir --upgrade pip \
    && /opt/venv/bin/pip install radian==0.6.15
ENV PATH="/opt/venv/bin:$PATH"



RUN install2.r -n -2 --skipinstalled --error \
    -r "${RCPP_REPO}" \
    -r "${CRAN_REPO}" \
    remotes \
    renv \
    devtools \
    yaml \
    languageserver \
    unigd \
    httpgd \
  && rm -rf /tmp/downloaded_packages






USER rstudio