# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/rstudio:4.4.3


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
    python3-dev \
    python3-pip \
    pipx \
    cmake \
  && apt-get autoremove -y \
  && apt-get clean all






RUN sudo -H -u rstudio pipx install radian
ENV PATH="/home/rstudio/.local/bin:${PATH}"




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
RUN R -e 'renv::install(c("languageserver", "nx10/unigd", "nx10/httpgd", "devtools", "yaml"))'

USER root
WORKDIR /

