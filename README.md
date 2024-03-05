[![](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

# Docker Images for R

These Docker images are optimized for use with the [reproducible R project template](https://github.com/mattocci27/rdv-template), which leverages Quarto and the `{targets}` package. The images contain minimal R packages to facilitate faster management of `renv` with cache.

## Images

| Docker Image                                                                                       | Description                                                                                                      |
|----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| [tinytex](https://hub.docker.com/repository/docker/mattocci/tinytex)                               | R Markdown, TinyTex, pandoc-crossref, and Quarto, without RStudio.                                               |
| [radian](https://hub.docker.com/repository/docker/mattocci/radian)                                 | Adds the Radian console to the [RStudio](https://hub.docker.com/r/rocker/rstudio) image. R packages should be managed with `renv`. Includes a `vscode-r` directory with some R packages (`devtools`, `httpgd`, ...) managed by `renv`. |
| [radian-verse](https://hub.docker.com/repository/docker/mattocci/radian-verse)                     | Extends the radian image with TinyTex and Quarto. The image is still smaller than [rocker/verse](https://hub.docker.com/r/rocker/verse). |
| [cmdstan-verse](https://hub.docker.com/repository/docker/mattocci/cmdstan-verse)                   | Adds CmdStanR to the [radian-verse](https://hub.docker.com/r/mattocci/radian-verse) image.                       |
| [cmdstan-verse-zsh](https://hub.docker.com/repository/docker/mattocci/cmdstan-verse-zsh)           | Adds Zsh shell to the [cmdstan-verse](https://hub.docker.com/r/mattocci/cmdstan-verse) image.                    |

Each image builds upon the previous one, adding additional tools and functionalities to support various R project needs.
