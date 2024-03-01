# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/rstudio:4.2.1


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libcairo2-dev \
    libglpk-dev \
    libxml2-dev \
    libzmq3-dev \
    libxt6 \
    python3-dev \
    python3-pip \
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
RUN R -e 'renv::install(c("languageserver", "httpgd@1.3.0", "devtools"))'

USER root
WORKDIR /

