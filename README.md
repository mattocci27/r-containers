# Docker and singularity images for R

[![GitHub License](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)


## Images

| docker                                                                         | singularity                                                                     | description                                                                                | r-ver |
|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|-------|
| [rstan](https://hub.docker.com/repository/docker/mattocci/rstan)               | [rstan](https://cloud.sylabs.io/library/mattocci27/default/rstan)               | adds rstan on [geospatial](https://hub.docker.com/r/rocker/geospatial)                     | 4.0.4 |
| [ppca](https://hub.docker.com/repository/docker/mattocci/ppca)                 | -                                                                               | adds phylogenetic tools on  [geospatial](https://hub.docker.com/r/rocker/geospatial)       | 4.0.4 |
| [myenv](https://hub.docker.com/repository/docker/mattocci/myenv)               | [myenv](https://cloud.sylabs.io/library/mattocci27/default/myenv)               | adds a bunch of packages on 'rstan'                                                        | 4.0.4 |
| [rmd-crossref](https://hub.docker.com/repository/docker/mattocci/rmd-crossref) | [rmd-crossref](https://cloud.sylabs.io/library/mattocci27/default/rmd-crossref) | adds pandoc-crossref and some R packages on [verse](https://hub.docker.com/r/rocker/verse) | 4.0.4 |
