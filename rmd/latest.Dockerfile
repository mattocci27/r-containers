FROM rocker/verse:3.6.3

RUN sed -i.bak -e "s%http://deb.debian.org/%http://mirror.lzu.edu.cn/%g" /etc/apt/sources.list \
  && sed -i.bak -e "s%http://security.debian.org/%http://mirror.lzu.edu.cn/%g" /etc/apt/sources.list

run apt update && apt install -y --fix-missing python3-pip \
  fd-find \
  exa \
  curl \
  lib32stdc++6 \
  ghostscript \
  libpoppler-cpp-dev \
  libtesseract-dev \
  libleptonica-dev \
  cargo \
  libwebp-dev \
  tesseract-ocr-eng \
  gdal-bin \ 
  proj-bin \
  libgdal-dev \
  libproj-dev \
  libavfilter-dev \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --default-timeout=100 -U radian

RUN curl https://gist.githubusercontent.com/mattocci27/e2d2d23dfcfd4b5dad1fbcb7ab60756c/raw/41f2e02c96e6a9c5bbad538abc4f94e474d54ea6/.radian_profile -o /home/rstudio/.radian_profile 

RUN install2.r -n 4 --error \
    --deps TRUE \
    -r "https://mirror.lzu.edu.cn/CRAN/" \
      kableExtra \
      magick \ 
      webshot \
  && Rscript -e "webshot::install_phantomjs()"
