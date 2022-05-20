# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/ml-verse:4.2.0


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
    latexdiff \
    clinfo \
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


#RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
RUN pip3 install --upgrade setuptools \
  && pip3 install --default-timeout=100 -U radian







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
