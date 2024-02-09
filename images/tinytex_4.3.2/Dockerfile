# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/r-ver:4.3.2


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libcairo2-dev \
    libglpk-dev \
    libxml2-dev \
    sudo \
    gosu \
    git \
  && apt-get autoremove -y \
  && apt-get clean all

ENV USER_NAME=rstudio

RUN useradd -m rstudio -u 1000 \
  && mkdir -p /home/rstudio \
  && chown -R rstudio /home/rstudio \
  && usermod -a -G staff rstudio

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
      apt-utils \
      xz-utils \
      curl \
      wget \
      libxt6 \
      texinfo \
      ghostscript \
      latexdiff \
    && apt-get autoremove -y \
    && apt-get autoclean -y

RUN echo "PATH=${PATH}" >> ${R_HOME}/etc/Renviron

RUN install2.r -n -2 --skipinstalled --error \
   tinytex

RUN wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh  \
  && mv ~/.TinyTeX/ opt/TinyTeX

ENV PATH="/opt/TinyTeX/bin/x86_64-linux:$PATH"

RUN /opt/TinyTeX/bin/*/tlmgr path add \
  && tlmgr install \
    ae \
    amsmath \
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
    fvextra \
    geometry \
    gettitlestring \
    hycolor \
    hyperref \
    inconsolata \
    intcalc \
    koma-script \
    kvdefinekeys \
    kvsetkeys \
    latex-amsmath-dev \
    latexmk \
    letltxmacro \
    lineno \
    listings \
    ltxcmds \
    ly1 \
    makecell \
    mdframed \
    mdwtools \
    metafont \
    mfware \
    multirow \
    needspace \
    oberdiek \
    parskip \
    pdfcol \
    pdfcrop \
    pdfescape \
    pdflscape \
    pgf \
    refcount \
    rerunfilecheck \
    setspace \
    sourcecodepro \
    sourcesanspro \
    stringenc \
    tabu \
    tcolorbox \
    tex \
    threeparttable \
    threeparttablex \
    titling \
    trimspaces \
    ulem \
    uniquecounter \
    upquote \
    varwidth \
    wrapfig \
    xcolor \
    zapfding \
    zref \
  && tlmgr path add \
  && Rscript -e "tinytex::r_texmf()" \
  && chown -R root:staff /opt/TinyTeX \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin
  #ae inconsolata listings metafont mfware parskip pdfcrop tex \
# RUN wget -qO- \
#     "https://github.com/yihui/tinytex/raw/main/tools/install-unx.sh" | \
#     TINYTEX_DIR=${TINYTEX_DIR} sh -s - --admin --no-path


ENV QUARTO_VERSION=

RUN  wget -N --no-check-certificate -q -O install_quarto.sh \
  "https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/scripts/install_quarto.sh" \
  && chmod +x install_quarto.sh \
  && bash install_quarto.sh \
  && rm install_quarto.sh


RUN tlmgr update --self

ENV PANDOC_VERSION=3.1.3
ENV CROSSREF_VERSION=0.3.16.0a

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




