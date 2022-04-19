# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/rstan:4.1.3


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    default-libmysqlclient-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libgit2-dev \
    libglpk-dev \
    libpq-dev \
    libpython3-dev \
    libsasl2-dev \
    libsqlite3-dev \
    libssh2-1-dev \
    libxml2-dev \
    libxt-dev \
    libxtst6 \
    python3-dev \
    python3-pip \
    unixodbc-dev \
    gosu \
  && apt-get autoremove -y \
  && apt-get clean all


RUN tlmgr update --self
RUN tlmgr install \
  amsmath \
  latex-amsmath-dev \
  babel-english \
  bigintcalc \
  bitset \
  bookmark \
  booktabs \
  caption \
  colortbl \
  csquotes \
  environ \
  epstopdf-pkg \
  etexcmds \
  fancyhdr \
  float \
  footnotebackref \
  geometry \
  gettitlestring \
  hycolor \
  hyperref \
  intcalc \
  koma-script \
  kvdefinekeys \
  kvsetkeys \
  latexmk \
  letltxmacro \
  lineno \
  ltxcmds \
  ly1 \
  makecell \
  mdframed \
  mdwtools \
  multirow \
  needspace \
  oberdiek \
  pdfcrop \
  pdfescape \
  pdflscape \
  refcount \
  rerunfilecheck \
  setspace \
  sourcecodepro \
  sourcesanspro \
  stringenc \
  tabu \
  threeparttable \
  threeparttablex \
  titling \
  trimspaces \
  ulem \
  uniquecounter \
  varwidth \
  wrapfig \
  xcolor \
  zapfding \
  zref

RUN rm -rf /usr/lib/rstudio-server/bin/pandoc/pandoc \
  usr/local/bin/pandoc \
  usr/lib/rstudio-server/bin/pandoc/pandoc-citeproc \
  usr/local/bin/pandoc-citeproc

#RUN PANDOC_DL_URL=$(wget -qO- https://api.github.com/repos/jgm/pandoc/releases/latest | grep -oP "(?<=\"browser_download_url\":\s\")https.*amd64.deb") \
RUN PANDOC_DL_URL=https://github.com/jgm/pandoc/releases/download/2.16.2/pandoc-2.16.2-1-amd64.deb \
  && wget ${PANDOC_DL_URL} -O pandoc-amd64.deb \
  && dpkg -i pandoc-amd64.deb \
  && rm pandoc-amd64.deb

## Symlink pandoc & standard pandoc templates for use system-wide
RUN PANDOC_TEMPLATES_VERSION=`pandoc -v | grep -oP "(?<=pandoc\s)[0-9\.]+$"` \
 && wget https://github.com/jgm/pandoc-templates/archive/${PANDOC_TEMPLATES_VERSION}.tar.gz -O pandoc-templates.tar.gz \
 && rm -fr /opt/pandoc/templates \
 && mkdir -p /opt/pandoc/templates \
 && tar xvf pandoc-templates.tar.gz \
 && cp -r pandoc-templates*/* /opt/pandoc/templates && rm -rf pandoc-templates* \
 && rm -fr /root/.pandoc \
 && mkdir /root/.pandoc && ln -s /opt/pandoc/templates /root/.pandoc/templates

#RUN CROSSREF_DL_URL=$(wget -qO- https://api.github.com/repos/lierdakil/pandoc-crossref/releases/latest | grep -oP "(?<=\"browser_download_url\":\s\")https.*tar\.xz" | grep Linux) \
RUN CROSSREF_DL_URL=https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.12.1a/pandoc-crossref-Linux.tar.xz \
  && wget -O - ${CROSSREF_DL_URL} | \
  tar Jxf - \
  && mv pandoc-crossref /usr/local/bin \
  && rm -rf pandoc-crossref.1

#RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
RUN pip3 install --upgrade setuptools \
  && pip3 install --default-timeout=100 -U radian

RUN Rscript -e "install.packages('BiocManager')" \
  && Rscript -e "BiocManager::install(c('marray', 'affy', 'Biobase'))"

RUN Rscript -e "install.packages('Rcpp')"


RUN install2.r -n -2 --skipinstalled --error \
    rmarkdown \
    methods \
    bookdown \
    knitr \
    kableExtra \
    tidyverse \
    devtools \
    png \
    grid \
    pander \
    kfigr \
  && rm -rf /tmp/downloaded_packages



ENV DEBIAN_FRONTEND teletype

RUN  apt-get update -q -y \
    && apt-get install ttf-mscorefonts-installer --fix-missing -y \
    && fc-cache -f \
    && apt-get autoremove -y \
    && apt-get autoclean -y

RUN install2.r -n -2 --skipinstalled --error \
  extrafont

RUN R -e 'remotes::install_version("Rttf2pt1", version = "1.3.8")'
RUN R -e 'extrafont::font_import(prompt = FALSE)'
