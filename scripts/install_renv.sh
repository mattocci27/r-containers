#!/bin/bash
set -e

# export RENV_VERSION=0.15.4
# export CMDSTAN_VERSION=2.29.2
# export PANDOC_VERSION=2.17.1.1
# export CROSSREF_VERSION=0.3.12.2a
RENV_VERSION=${RENV_VERSION}

# Add renv settings for global cache as well as linux distro specific
# directory hierarchy in cache (optional but useful)
echo "#renv settings\nRENV_PATHS_PREFIX_AUTO = TRUE\nRENV_PATHS_CACHE=/home/$(whoami)/renv" >> /usr/local/lib/R/etc/Renviron.site

# Install renv
R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
