# Docker and singularity images for R

[![GitHub License](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)


## Docker images

| image                                                            | description                                                                          | r-ver        |
|------------------------------------------------------------------|--------------------------------------------------------------------------------------|--------------|
| [rstan](https://hub.docker.com/repository/docker/mattocci/rstan) | adds rstan on [geospatial](https://hub.docker.com/r/rocker/geospatial)               | 3.6.3, 4.0.2 |
| [ppca](https://hub.docker.com/repository/docker/mattocci/ppca)   | adds phylogenetic tools on  [geospatial](https://hub.docker.com/r/rocker/geospatial) | 3.6.3, 4.0.2 |
| [myenv](https://hub.docker.com/repository/docker/mattocci/myenv) | adds a bunch of packages on 'rstan'                                                  | 3.6.3, 4.0.2 |

## Singularity images

`dokcker_to_sing.py` generates SIF (Singularity Image Format) files from a local docker
repository.

```
python3 docker_to_sing.py <ip to your docker private repo>
python3 docker_to_sing.py 192.168.1.123:5000   
```
