# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/r-ver:4.1.2


ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libxml2-dev \
    libcairo2-dev \
    libgit2-dev \
    default-libmysqlclient-dev \
    libpq-dev \
    libsasl2-dev \
    libsqlite3-dev \
    libssh2-1-dev \
    libxtst6 \
    libcurl4-openssl-dev \
    unixodbc-dev \
    libglpk-dev \
    libxt-dev \
    gosu \
  && apt-get autoremove -y \
  && apt-get clean all

ENV DEBIAN_FRONTEND teletype

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
      apt-utils \
      curl \
      wget \
      texinfo \
      apt-utils \
      ghostscript \
      latexdiff \
    && apt-get autoremove -y \
    && apt-get autoclean -y

RUN yes | apt-get install ttf-mscorefonts-installer \
    && fc-cache -f \
    && apt-get autoremove -y \
    && apt-get autoclean -y

ARG TINYTEX_DIR='/opt/tinytex'

RUN mkdir ${TINYTEX_DIR}

RUN install2.r -n -1 --skipinstalled --error \
      tinytex

  #RUN Rscript -e "tinytex::install_tinytex()"
  #ENV PATH=$PATH:/root/.TinTeX/bin/x86_64-linux/

RUN wget -qO- \
    "https://github.com/yihui/tinytex/raw/main/tools/install-unx.sh" | \
    TINYTEX_DIR=${TINYTEX_DIR} sh -s - --admin --no-path \
  && ${TINYTEX_DIR}/bin/*/tlmgr path add


RUN Rscript -e "tinytex::tlmgr_install(c('pdfcrop', \
    'koma-script', \
    'setspace', \
    'colortbl', \
    'footnotebackref', \
    'multirow', \
    'wrapfig', \
    'pdflscape', \
    'tabu', \
    'varwidth', \
    'threeparttable', \
    'threeparttablex', \
    'environ', \
    'trimspaces', \
    'ulem', \
    'makecell', \
    'lineno', \
    'babel-english', \
    'csquotes', \
    'caption', \
    'mdframed', \
    'zref', \
    'needspace', \
    'sourcesanspro', \
    'ly1', \
    'sourcecodepro', \
    'oberdiek', \
    'titling', \
    'fancyhdr', \
    'bookmark'))"

RUN useradd -m rstudio -u 1000 \
    && mkdir -p /home/rstudio \
    && chown -R rstudio /home/rstudio \
    && usermod -a -G staff rstudio

RUN chown -R rstudio:staff ${TINYTEX_DIR} \
    && chown -R rstudio:staff /usr/local/lib/R/site-library \
    && chmod -R g+w ${TINYTEX_DIR} \
    && chmod -R g+wx "${TINYTEX_DIR}/bin" \
    && umask 022

RUN tlmgr path add \
  && Rscript -e "tinytex::r_texmf()" \
  && chown -R rstudio:staff ${TINYTEX_DIR} \
  && chown -R rstudio:staff /usr/local/lib/R/site-library \
  && chmod -R g+w ${TINYTEX_DIR} \
  && chmod -R g+wx "${TINYTEX_DIR}/bin"

RUN echo "PATH=${PATH}" >> ${R_HOME}/etc/Renviron

RUN install2.r -n -2 --skipinstalled --error \
  remotes \
  extrafont

RUN R -e 'remotes::install_version("Rttf2pt1", version = "1.3.8")'

RUN R -e 'extrafont::font_import(prompt = FALSE)'


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


