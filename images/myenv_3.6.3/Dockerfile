# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/rstan:3.6.3


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

RUN Rscript -e "install.packages('BiocManager')" \
  && Rscript -e "BiocManager::install(c('marray', 'affy', 'Biobase'))"


RUN install2.r -n -1 --skipinstalled --error \
  --deps TRUE \
    adespatial \
    vegan \
    MuMIn \
    furrr \
    tictoc \
    snowfall \
    sads \
    ggthemes \
    blogdown \
    kableExtra \
    picante \
    provenance \
    ggrepel \
    languageserver \
    png \
    pander \
    memisc \
    mnormt \
    mvtnorm \
    GGally \
    hexbin \
    corrplot \
    FactoMineR \
    factoextra \
    adephylo \
    phytools \
    picante \
    smatr \
    nlme \
    caper \
    kfigr \
    multcompView \
    minerva \
    ecoCopula \
  && rm -rf /tmp/downloaded_packages
