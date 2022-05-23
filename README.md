# Docker and singularity images for R

[![GitHub License](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)


## Images

| docker                                                                   | singularity                                                       | description                                                                       |
|--------------------------------------------------------------------------|-------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| [rstan](https://hub.docker.com/repository/docker/mattocci/rstan)         | [rstan](https://cloud.sylabs.io/library/mattocci27/default/rstan) | adds rstan on [geospatial](https://hub.docker.com/r/rocker/geospatial)            |
| [radian](https://hub.docker.com/repository/docker/mattocci/radian)       | -                                                                 | adds radian and fonts on [rstudio](https://hub.docker.com/r/rocker/rstudio)       |
| [radian-ml](https://hub.docker.com/repository/docker/mattocci/radian-ml) | -                                                                 | adds radian and fonts on [ml](https://hub.docker.com/r/rocker/ml)                 |
| [rmd-light](https://hub.docker.com/repository/docker/mattocci/rmd-light) | -                                                                 | R markdown + TinyTex + pandoc-crossref without Rstudio                            |
| [cmdstanr](https://hub.docker.com/repository/docker/mattocci/cmdstanr)   | -                                                                 | adds cmdstanr on [ml](https://hub.docker.com/r/rocker/ml) (GPU supported)         |


## Push to a private repository

`push_to_pr.sh <r-version> <ip>`

```
push_to_pr.sh 4.1.3 xxx.xxx.xx.xx:xxx
```
