# Docker and singularity images for R

[![GitHub License](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)


## Images

| docker                                                                         | singularity                                                                     | description                                                                                | r-ver        |
|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|--------------|
| [rstan](https://hub.docker.com/repository/docker/mattocci/rstan)               | [rstan](https://cloud.sylabs.io/library/mattocci27/default/rstan)               | adds rstan on [geospatial](https://hub.docker.com/r/rocker/geospatial)                     | 3.6.3, 4.1.2 |
| [myenv](https://hub.docker.com/repository/docker/mattocci/myenv)               | [myenv](https://cloud.sylabs.io/library/mattocci27/default/myenv)               | adds a bunch of packages on 'rstan'                                                        | 3.6.3, 4.1.2 |
| [rmd-light](https://hub.docker.com/repository/docker/mattocci/rmd-light)               | -               | R markdown + TinyTex + pandoc-crossref without Rstudio |  4.1.2 |
| [cmdstanr](https://hub.docker.com/repository/docker/mattocci/cmdstanr)               | -               | adds cmdstanr on [ml](https://hub.docker.com/r/rocker/ml) (GPU supported)                  | 4.1.2 |



## Push to a private repository

`push_to_pr.sh <r-version> <ip>`

```
push_to_pr.sh 4.1.3 xxx.xxx.xx.xx:xxx
```
