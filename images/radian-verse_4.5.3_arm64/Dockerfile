# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
ARG BASE_IMAGE=mattocci/radian:4.5.3_arm64
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
    libnode-dev \
    libudunits2-dev \
    gdal-bin \
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    netcdf-bin \
    protobuf-compiler \
    sqlite3 \
    tk-dev \
    unixodbc-dev \
    libmagick++-dev \
    libmagickcore-6.q16-6-extra \
    fonts-roboto \
    fonts-open-sans \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
      apt-utils \
      xz-utils \
      curl \
      wget \
      perl-doc \
      libxt6 \
      texinfo \
      ghostscript \
      latexdiff \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo "PATH=${PATH}" >> ${R_HOME}/etc/Renviron

RUN install2.r -n -2 --skipinstalled --error \
   -r "${RCPP_REPO}" \
   -r "${CRAN_REPO}" \
   tinytex

USER rstudio

RUN export CTAN_REPO="${CTAN_REPO}" \
  && wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" | sh

ENV PATH="/home/rstudio/bin/:$PATH"

# Initialize tlmgr in user mode (creates a user-specific tree for packages)
RUN tlmgr init-usertree

RUN R -e "tinytex::tlmgr_install( \
  c('booktabs', \
    'caption', \
    'colortbl', \
    'multirow', \
    'makecell', \
    'threeparttable', \
    'threeparttablex', \
    'koma-script', \
    'environ', \
    'pdflscape', \
    'pgf', \
    'tcolorbox', \
    'listings', \
    'fvextra', \
    'microtype', \
    'setspace', \
    'lineno', \
    'titlesec', \
    'csquotes'))"

USER root


ENV QUARTO_VERSION=1.9.37

RUN quarto_arch="$(dpkg --print-architecture)" \
  && case "${quarto_arch}" in \
    amd64|arm64) ;; \
    *) echo "Unsupported Quarto architecture: ${quarto_arch}" >&2; exit 1 ;; \
  esac \
  && wget -q -O quarto.deb \
    "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-${quarto_arch}.deb" \
  && apt-get update -q -y \
  && apt-get install --no-install-recommends -y ./quarto.deb \
  && rm quarto.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*












USER rstudio