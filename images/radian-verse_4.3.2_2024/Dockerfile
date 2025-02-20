# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/radian:4.3.2_2024


ENV DEBIAN_FRONTEND=noninteractive

# Debug output to confirm TARGETPLATFORM (optional)
RUN echo "TARGETPLATFORM: ${TARGETPLATFORM}"

# Patch libc-bin post-installation script for ARM builds
RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
      echo '#!/bin/sh\nexit 0' > /var/lib/dpkg/info/libc-bin.postinst && \
      chmod +x /var/lib/dpkg/info/libc-bin.postinst; \
    fi



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

USER rstudio

RUN wget --no-check-certificate -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" | sh

ENV PATH="/home/rstudio/bin/:$PATH"

RUN R -e "tinytex::tlmgr_install( \
  c('ae', \
    'amsmath', \
    'babel-english', \
    'bigintcalc', \
    'bitset', \
    'bookmark', \
    'booktabs', \
    'caption', \
    'colortbl', \
    'csquotes', \
    'environ', \
    'epstopdf-pkg', \
    'etexcmds', \
    'fancyhdr', \
    'float', \
    'footnotebackref', \
    'fvextra', \
    'geometry', \
    'gettitlestring', \
    'hycolor', \
    'hyperref', \
    'inconsolata', \
    'intcalc', \
    'koma-script', \
    'kvdefinekeys', \
    'kvsetkeys', \
    'latex-amsmath-dev', \
    'latexmk', \
    'letltxmacro', \
    'lineno', \
    'listings', \
    'ltxcmds', \
    'ly1', \
    'makecell', \
    'mdframed', \
    'mdwtools', \
    'metafont', \
    'mfware', \
    'multirow', \
    'needspace', \
    'oberdiek', \
    'parskip', \
    'pdfcol', \
    'pdfcrop', \
    'pdfescape', \
    'pdflscape', \
    'pgf', \
    'refcount', \
    'rerunfilecheck', \
    'setspace', \
    'sourcecodepro', \
    'sourcesanspro', \
    'stringenc', \
    'tabu', \
    'tcolorbox', \
    'tex', \
    'threeparttable', \
    'threeparttablex', \
    'titling', \
    'titlesec', \
    'trimspaces', \
    'ulem', \
    'uniquecounter', \
    'upquote', \
    'varwidth', \
    'wrapfig', \
    'xcolor', \
    'zapfding', \
    'zref'))"

USER root


ENV QUARTO_VERSION=1.6.40

RUN  wget -N --no-check-certificate -q -O install_quarto.sh \
  "https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/scripts/install_quarto.sh" \
  && chmod +x install_quarto.sh \
  && bash install_quarto.sh \
  && rm install_quarto.sh


RUN tlmgr option repository http://ctan.math.utah.edu/ctan/tex-archive/systems/texlive/tlnet && \
    tlmgr update --self --all











