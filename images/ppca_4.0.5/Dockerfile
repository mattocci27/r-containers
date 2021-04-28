# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/geospatial:4.0.5


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libpython3-dev \
    python3-dev \
    python3-pip \
  && apt-get autoremove -y \
  && apt-get clean all


RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
  && pip3 install --upgrade setuptools \
  && pip3 install --default-timeout=100 -U radian


RUN installGithub.r \
  jinyizju/V.PhyloMaker

RUN install2.r -n -1 --skipinstalled --error \
  --deps TRUE \
    adephylo \
    phytools \
    factoextra \
    picante \
    phylolm \
    smatr \
    lme4 \
    nlme \
    caper \
  && rm -rf /tmp/downloaded_packages
