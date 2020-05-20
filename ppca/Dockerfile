FROM rocker/verse:3.6.3

RUN sed -i.bak -e "s%http://deb.debian.org/%http://mirror.lzu.edu.cn/%g" /etc/apt/sources.list \
  && sed -i.bak -e "s%http://security.debian.org/%http://mirror.lzu.edu.cn/%g" /etc/apt/sources.list

RUN apt update && apt install -y --fix-missing python3-pip \
  fd-find \
  exa \
  curl \
  libudunits2-dev \
  libgl1-mesa-dev \
  libglu1-mesa-dev \
  libgdal-dev \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*

#RUN ping gist.githubusercontent.com 

RUN pip3 install --default-timeout=100 -U radian

RUN curl https://gist.githubusercontent.com/mattocci27/e2d2d23dfcfd4b5dad1fbcb7ab60756c/raw/41f2e02c96e6a9c5bbad538abc4f94e474d54ea6/.radian_profile -o /home/rstudio/.radian_profile 

RUN mkdir -p /home/rstudio/.R/ \
  && sed -i.bak -e "s/cran.rstudio.com/mirror.lzu.edu.cn\/CRAN/g" /usr/local/lib/R/etc/Rprofile.site \
  && echo 'options(repos = c(CRAN = "https://mirror.lzu.edu.cn/CRAN/"), download.file.method = "libcurl")' >> /home/rstudio/.Rprofile

RUN R -e 'devtools::install_github("helixcn/plantlist", host = "https://api.github.com")' 
RUN R -e 'devtools::install_github("husson/FactoMineR")' 
RUN R -e 'devtools::install_github("jinyizju/V.PhyloMaker", host = "https://api.github.com")'

RUN install2.r -n 4 --error \
    --deps TRUE \
    factoextra \
    rgl \
    smatr \
    corrplot \
    phytools \
    ggrepel \
    phylobase \
    adephylo \
    picante
