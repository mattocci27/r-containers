FROM mattocci/rstan:3.6.3

RUN sed -i.bak -e "s%http://deb.debian.org/%http://mirror.lzu.edu.cn/%g" /etc/apt/sources.list \
  && sed -i.bak -e "s%http://security.debian.org/%http://mirror.lzu.edu.cn/%g" /etc/apt/sources.list

RUN apt update && apt install -y --fix-missing python3-pip \
  curl \
  fd-find \
  exa \
  libudunits2-dev \
  libgl1-mesa-dev \
  libglu1-mesa-dev \
  libgdal-dev \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --default-timeout=100 -U radian

RUN curl https://gist.githubusercontent.com/mattocci27/e2d2d23dfcfd4b5dad1fbcb7ab60756c/raw/41f2e02c96e6a9c5bbad538abc4f94e474d54ea6/.radian_profile -o /home/rstudio/.radian_profile 

RUN install2.r -n 4 --error \
    --deps TRUE \
    -r "https://mirror.lzu.edu.cn/CRAN/" \
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
    kfigr \
    memisc \
    mvtnorm \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
