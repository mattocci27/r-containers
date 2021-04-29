# Docker and singularity images for R

[![GitHub License](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)


## Images

| docker                                                                         | singularity                                                                     | description                                                                                | r-ver        |
|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|--------------|
| [rstan](https://hub.docker.com/repository/docker/mattocci/rstan)               | [rstan](https://cloud.sylabs.io/library/mattocci27/default/rstan)               | adds rstan on [geospatial](https://hub.docker.com/r/rocker/geospatial)                     | 3.6.3, 4.0.5 |
| [ppca](https://hub.docker.com/repository/docker/mattocci/ppca)                 | -                                                                               | adds phylogenetic tools on  [geospatial](https://hub.docker.com/r/rocker/geospatial)       | 3.6.3, 4.0.5 |
| [myenv](https://hub.docker.com/repository/docker/mattocci/myenv)               | [myenv](https://cloud.sylabs.io/library/mattocci27/default/myenv)               | adds a bunch of packages on 'rstan'                                                        | 3.6.3, 4.0.5 |
| [rmd-light](https://hub.docker.com/repository/docker/mattocci/rmd-light)               | -               | R markdown + TinyTex + pandoc-crossref without Rstudio and Tidyverse |  4.0.5 |
