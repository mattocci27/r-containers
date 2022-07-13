[![](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

# Docker and Apptainer images for R

## Images

| docker                                                                   | description                                                                                                             |
|--------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| [radian](https://hub.docker.com/repository/docker/mattocci/radian)       | adds radian and fonts on [rstudio](https://hub.docker.com/r/rocker/rstudio) (packages need to be installed by `renv`) |
| [radian-ml](https://hub.docker.com/repository/docker/mattocci/radian-ml) | adds radian and fonts on [ml](https://hub.docker.com/r/rocker/ml) (packages need to be installed by `renv`)           |
| [tinytex](https://hub.docker.com/repository/docker/mattocci/tinytex)     | R markdown + TinyTex + pandoc-crossref + quarto without Rstudio                                                         |
| [rstan](https://hub.docker.com/repository/docker/mattocci/rstan)         | adds rstan on [geospatial](https://hub.docker.com/r/rocker/geospatial)                                                  |
| [cmdstanr](https://hub.docker.com/repository/docker/mattocci/cmdstanr)   | adds cmdstanr on [ml](https://hub.docker.com/r/rocker/ml) (GPU supported)                                               |


## Push to a private repository

`push_to_pr.sh <r-version> <ip>`

```
./scripts/push_to_private.sh 4.2.1 xxx.xxx.xxx.xxx:xxxx
```

```
./scripts/pull_from_private.sh 4.2.1 xxx.xxx.xxx.xxx:xxxx
```

# Example for Apptainer (Singularity)

This demonstration uses `tictoc` restored by `renv` to record elapsed time inside the radian container as an example.

1. Navigate to the `tictoc` directory.

```
cd tictoc
```

2. Change `RENV_PATHS_CACHE` in `radian.def` to your path (i.e.,
`
RENV_PATHS_CACHE=<your_path>"
`
).

3. Build an Apptainer image:

```
sudo apptainer build radian.sif radian.def
```

- Run a shell.

You can see `renv` being activated and the `tictoc` package can be restored:

```
apptainer shell radian.sif

Apptainer> radian
# Bootstrapping renv 0.15.4 --------------------------------------------------
* Downloading renv 0.15.4 ... OK
* Installing renv 0.15.4 ... Done!
* Successfully installed and loaded renv 0.15.4.

* Project '~/r-containers/tictoc' loaded. [renv 0.15.4]
* The project library is out of sync with the lockfile.
* Use `renv::restore()` to install packages recorded in the lockfile.
R version 4.2.0 (2022-04-22) -- "Vigorous Calisthenics"
Platform: x86_64-pc-linux-gnu (64-bit)

[ins] r$> renv::restore()
The following package(s) will be updated:

# GitHub =============================
- renv     [0.15.4 -> rstudio/renv@0.15.4]

# RSPM ===============================
- tictoc   [* -> 1.0.1]

[ins] Do you want to proceed? [y/N]: y
* Querying repositories for available source packages ... Done!
Retrieving 'https://packagemanager.rstudio.com/all/__linux__/focal/latest/src/contrib/tictoc_1.0.1.tar.gz' ...
        OK [downloaded 134.5 Kb in 0.4 secs]
Installing tictoc [1.0.1] ...
        OK [installed binary]
Moving tictoc [1.0.1] into the cache ...
        OK [moved to cache in 0.92 milliseconds]

[ins] r$> library(tictoc)

          tic()
          Sys.sleep(1)
          toc()
1.002 sec elapsed
```


- Or run an Rscript.

```
apptainer exec radian.sif Rscript check_time.R
1.002 sec elapsed
```

You can also specify the path to your renv cache when you start the container:

```
apptainer shell radian.sif --bind ~/renv:/usr/local/lib/R/etc/Renviron.site
```
