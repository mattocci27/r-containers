# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/verse:4.0.2


RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libpython3-dev \
    python3-dev \
    python3-pip \
  && apt-get autoremove -y \
  && apt-get clean all

RUN curl -sSL https://get.haskellstack.org/ | sh
RUN git clone https://github.com/lierdakil/pandoc-crossref.git /usr/local/bin/pandoc-crossref
WORKDIR /usr/local/bin/pandoc-crossref
RUN stack install
WORKDIR /

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
