# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/r-ver:4.2.0


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libcairo2-dev \
    gosu \
  && apt-get autoremove -y \
  && apt-get clean all

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

ENV PANDOC_VERSION=2.17.1.1
ENV CROSSREF_VERSION=0.3.12.2a

COPY scripts/install_crossref.sh  /rocker_scripts/install_crossref.sh

RUN /rocker_scripts/install_crossref.sh





RUN install2.r -n -2 --skipinstalled --error \
    rmarkdown \
    methods \
    bookdown \
    knitr \
    kableExtra \
    tidyverse \
    devtools \
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
