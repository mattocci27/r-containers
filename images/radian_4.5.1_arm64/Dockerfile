# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/rstudio:4.5.1


ENV DEBIAN_FRONTEND=noninteractive

# Debug output to confirm TARGETPLATFORM (optional)
ARG TARGETPLATFORM
RUN echo "TARGETPLATFORM: ${TARGETPLATFORM}"

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libcairo2-dev \
    libcurl4-openssl-dev \
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
    python3-venv \
    python3-dev \
    python3-pip \
    pipx \
    cmake \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*






RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --no-cache-dir --upgrade pip \
    && /opt/venv/bin/pip install radian
ENV PATH="/opt/venv/bin:$PATH"




RUN install2.r -n -2 --skipinstalled --error \
    remotes \
    renv \
    devtools \
    yaml \
    languageserver \
  && rm -rf /tmp/downloaded_packages





