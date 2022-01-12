# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/rstan:4.1.2


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libpython3-dev \
    python3-dev \
    python3-pip \
    gosu \
  && apt-get autoremove -y \
  && apt-get clean all



#RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
RUN pip3 install --upgrade setuptools \
  && pip3 install --default-timeout=100 -U radian

RUN Rscript -e "install.packages('BiocManager')" \
  && Rscript -e "BiocManager::install(c('marray', 'affy', 'Biobase'))"

RUN installGithub.r \
  rstudio/fontawesome\ hadley/emo\ gordy2x/ecoCopula\ yihui/xaringan\ curso-r/treesnip

RUN install2.r -n -2 --skipinstalled --error \
    adespatial \
    carData \
    vegan \
    MuMIn \
    furrr \
    tictoc \
    snowfall \
    sads \
    ggthemes \
    gganimate \
    blogdown \
    kableExtra \
    picante \
    provenance \
    ggrepel \
    languageserver \
    mnormt \
    png \
    pander \
    memisc \
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
    entropart \
    FD \
    minerva \
    patchwork \
    RColorBrewer \
    smatr \
    flair \
    httpgd \
    doMC \
    doSNOW \
    lavaan \
    lavaanPlot \
    semPlot \
    tidymodels \
    skimr \
    janitor \
    lightgbm \
    AmesHousing \
    ParBayesianOptimization \
    animation \
  && rm -rf /tmp/downloaded_packages


ENV DEBIAN_FRONTEND teletype
RUN yes | apt-get install ttf-mscorefonts-installer \
    && fc-cache -f \
    && apt-get autoremove -y \
    && apt-get autoclean -y

RUN install2.r -n -2 --skipinstalled --error \
  extrafont

RUN R -e 'remotes::install_version("Rttf2pt1", version = "1.3.8")'
RUN R -e 'extrafont::font_import(prompt = FALSE)'
