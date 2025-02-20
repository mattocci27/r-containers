# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/rstudio:4.3.2


ENV DEBIAN_FRONTEND=noninteractive

# If running under QEMU emulation, disable the libc-bin post-install script
# RUN if [ -f /usr/bin/qemu-aarch64-static ]; then \
RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
      echo '#!/bin/sh\nexit 0' > /var/lib/dpkg/info/libc-bin.postinst && \
      chmod +x /var/lib/dpkg/info/libc-bin.postinst; \
    fi

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
    python3-pip \
    cmake \
  && apt-get autoremove -y \
  && apt-get clean all






RUN pip3 install setuptools==58.2.0 \
  && pip3 install -U radian




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
RUN R -e 'renv::install(c("languageserver", "nx10/httpgd", "devtools", "yaml"))'

USER root
WORKDIR /

