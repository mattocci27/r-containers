#!/bin/bash
set -e

# export RENV_VERSION=0.15.4
# export CMDSTAN_VERSION=2.29.2
# export PANDOC_VERSION=2.17.1.1
# export CROSSREF_VERSION=0.3.12.2a
RENV_VERSION=${RENV_VERSION}
CMDSTAN_VERSION=${CMDSTAN_VERSION}
PANDOC_VERSION=${PANDOC_VERSION}
CROSSREF_VERSION=${CROSSREF_VERSION}

# Add renv settings for global cache as well as linux distro specific
# directory hierarchy in cache (optional but useful)
echo "#renv settings\nRENV_PATHS_PREFIX_AUTO = TRUE\nRENV_PATHS_CACHE=/home/$(whoami)/renv" >> /usr/local/lib/R/etc/Renviron.site

# Install renv
R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Install pandoc
rm -rf /usr/lib/rstudio-server/bin/pandoc/pandoc \
usr/local/bin/pandoc \
usr/lib/rstudio-server/bin/pandoc/pandoc-citeproc \
usr/local/bin/pandoc-citeproc

#  PANDOC_DL_URL=$(wget -qO- https://api.github.com/repos/jgm/pandoc/releases/latest | grep -oP "(?<=\"browser_download_url\":\s\")https.*amd64.deb") \
PANDOC_DL_URL=https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-amd64.deb \
&& wget ${PANDOC_DL_URL} -O pandoc-amd64.deb \
&& dpkg -i pandoc-amd64.deb \
&& rm pandoc-amd64.deb

## Symlink pandoc & standard pandoc templates for use system-wide
PANDOC_TEMPLATES_VERSION=`pandoc -v | grep -oP "(?<=pandoc\s)[0-9\.]+$"` \
&& wget https://github.com/jgm/pandoc-templates/archive/${PANDOC_TEMPLATES_VERSION}.tar.gz -O pandoc-templates.tar.gz \
&& rm -fr /opt/pandoc/templates \
&& mkdir -p /opt/pandoc/templates \
&& tar xvf pandoc-templates.tar.gz \
&& cp -r pandoc-templates*/* /opt/pandoc/templates && rm -rf pandoc-templates* \
&& rm -fr /root/.pandoc \
&& mkdir /root/.pandoc && ln -s /opt/pandoc/templates /root/.pandoc/templates

# Install cross-ref
#  CROSSREF_DL_URL=$(wget -qO- https://api.github.com/repos/lierdakil/pandoc-crossref/releases/latest | grep -oP "(?<=\"browser_download_url\":\s\")https.*tar\.xz" | grep Linux) \
CROSSREF_DL_URL=https://github.com/lierdakil/pandoc-crossref/releases/download/v${CROSSREF_VERSION}/pandoc-crossref-Linux.tar.xz \
&& wget -O - ${CROSSREF_DL_URL} | \
tar Jxf - \
&& mv pandoc-crossref /usr/local/bin \
&& rm -rf pandoc-crossref.1


## Install cmdstan
#  cd /opt/cmdstan/
#  wget https://github.com/stan-dev/cmdstan/releases/download/v${CMDSTAN_VERSION}/cmdstan-${CMDSTAN_VERSION}.tar.gz
#  tar xvf cmdstan-${CMDSTAN_VERSION}.tar.gz
#  cd cmdstan-${CMDSTAN_VERSION}; make -j 12 build
#  cd ..; rm cmdstan-${CMDSTAN_VERSION}.tar.gz
#  chmod 777 /opt/cmdstan/cmdstan-${CMDSTAN_VERSION}
