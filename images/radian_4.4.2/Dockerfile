# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/r-ver:4.4.2


ENV DEBIAN_FRONTEND=noninteractive
USER root

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libcairo2-dev \
    libglpk-dev \
    libxml2-dev \
    libzmq3-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libgit2-dev \
    libxt6 \
    python3-dev \
    python3-venv \
    python3-pip \
    cmake \
    libcurl4-openssl-dev \
    imagemagick \
    ghostscript \
  && apt-get autoremove -y \
  && apt-get clean all

ENV USER_NAME=rstudio

RUN apt-get update -q -y \
  && apt-get install -y sudo \
  && useradd -m rstudio -u 1000 \
  && mkdir -p /home/rstudio \
  && chown -R rstudio /home/rstudio \
  && usermod -a -G staff rstudio \
  && usermod -aG sudo rstudio \
  && echo "rstudio ALL=(ALL) NOPASSWD:/usr/bin/apt-get" >> /etc/sudoers





RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-cache-dir setuptools==58.2.0 radian
RUN echo 'options(repos = c(CRAN = "https://packagemanager.posit.co/cran/__linux__/jammy/latest"))' >> /usr/local/lib/R/etc/Rprofile.site




RUN install2.r -n -2 --skipinstalled --error \
    remotes \
    renv \
  && rm -rf /tmp/downloaded_packages




# vscode-R
USER rstudio
RUN mkdir -p /home/rstudio/vscode-R

WORKDIR /home/rstudio

RUN R -e 'renv::init(project = "/home/rstudio/vscode-R")'

WORKDIR /home/rstudio/vscode-R
RUN R -e 'renv::install(c("languageserver", "httpgd", "devtools", "yaml"))'

USER root
WORKDIR /

