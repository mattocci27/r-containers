Docker and singularity images for R
================

<div>

[![](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

</div>

## Images

| docker                                                                   | singularity                                                       | description                                                                                                             |
|--------------------------------------------------------------------------|-------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| [rstan](https://hub.docker.com/repository/docker/mattocci/rstan)         | [rstan](https://cloud.sylabs.io/library/mattocci27/default/rstan) | adds rstan on [geospatial](https://hub.docker.com/r/rocker/geospatial)                                                  |
| [radian](https://hub.docker.com/repository/docker/mattocci/radian)       | \-                                                                | adds radian and fonts on [rstudio](https://hub.docker.com/r/rocker/rstudio) (packages need to be installed by {{renv}}) |
| [radian-ml](https://hub.docker.com/repository/docker/mattocci/radian-ml) | \-                                                                | adds radian and fonts on [ml](https://hub.docker.com/r/rocker/ml) (packages need to be installed by {{renv}})           |
| [tinytex](https://hub.docker.com/repository/docker/mattocci/tinytex)     | \-                                                                | R markdown + TinyTex + pandoc-crossref + quarto without Rstudio                                                         |
| [cmdstanr](https://hub.docker.com/repository/docker/mattocci/cmdstanr)   | \-                                                                | adds cmdstanr on [ml](https://hub.docker.com/r/rocker/ml) (GPU supported)                                               |

## Push to a private repository

`push_to_pr.sh <r-version> <ip>`

    scripts/push_to_pr.sh 4.1.3 xxx.xxx.xx.xx:xxx

    scripts/pull_from_pr.sh 4.2.0 xxxx

# Usage (working)

-   Build a singularity container:

<!-- -->

    cd examples
    sudo singularity build radian.sif radian.def

``` bash
BootStrap: docker
From: mattocci/radian:4.2.0

%apprun R
  exec R "${@}"

%apprun Rscript
  exec Rscript "${@}"

%runscript
  exec R "${@}"

%environment
%post
  DEBIAN_FRONTEND=noninteractive
  export RENV_VERSION=0.15.4

  # Install dependencies if you need
  # apt-get update -q -y \
  #   && apt-get install --no-install-recommends --fix-missing -y \
  #     libzmq3-dev \
  #     libxt6 \
  #   && apt-get autoremove -y \
  #   && apt-get clean all

  # Add renv settings for global cache as well as linux distro specific
    # directory hierarchy in cache (optional but useful)
    echo "#renv settings\nRENV_PATHS_PREFIX_AUTO = TRUE\nRENV_PATHS_CACHE=/home/mattocci/renv" >> /usr/local/lib/R/etc/Renviron.site

  # Install renv
  R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
  R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
```
