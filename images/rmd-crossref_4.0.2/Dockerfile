# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/verse:4.0.2


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libpython3-dev \
    python3-dev \
    python3-pip \
  && apt-get autoremove -y \
  && apt-get clean all

RUN PANDOC_DL_URL=$(wget -qO- https://api.github.com/repos/lierdakil/pandoc-crossref/releases/latest | grep -oP "(?<=\"browser_download_url\":\s\")https.*tar\.xz" | grep Linux) \
  && wget -O - ${PANDOC_DL_URL} | \
  tar Jxf - \
  && mv pandoc-crossref /usr/local/bin \
  && rm -rf pandoc-crossref.1

RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
  && pip3 install --upgrade setuptools \
  && pip3 install --default-timeout=100 -U radian



RUN install2.r -n -1 --skipinstalled --error \
  --deps TRUE \
    methods \
    knitr \
    kableExtra \
    png \
    grid \
    pander \
    kfigr \
  && rm -rf /tmp/downloaded_packages
