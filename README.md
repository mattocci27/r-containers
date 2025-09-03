[![](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

# Docker Images for R

These Docker images are optimized for use with the [reproducible R project template](https://github.com/mattocci27/rdv-template), which leverages Quarto and the `{targets}` package. The images contain minimal R packages to facilitate faster management of `renv` with cache.

## Images

### Base Images
| Docker Image                                                                                       | Description                                                                                                      |
|----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| [radian](https://hub.docker.com/repository/docker/mattocci/radian)                                 | Adds the Radian console to the [RStudio](https://hub.docker.com/r/rocker/rstudio) image. R packages should be managed with `renv`. Includes a `vscode-r` directory with some R packages (`devtools`, `httpgd`, ...) managed by `renv`. |
| [radian-verse](https://hub.docker.com/repository/docker/mattocci/radian-verse)                     | Extends the radian image with TinyTeX and Quarto. The image is still smaller than [rocker/verse](https://hub.docker.com/r/rocker/verse). |
| [cmdstan-verse](https://hub.docker.com/repository/docker/mattocci/cmdstan-verse)                   | Adds CmdStanR to the [radian-verse](https://hub.docker.com/r/mattocci/radian-verse) image.                       |

### Enhanced Images with Additional Tools
| Docker Image                                                                                       | Description                                                                                                      |
|----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| [radian-claude](https://hub.docker.com/repository/docker/mattocci/radian-claude)                   | Extends radian-verse with Zsh shell and [Claude Code](https://claude.ai/code) CLI for AI-assisted development. |
| [cmdstan-zsh](https://hub.docker.com/repository/docker/mattocci/cmdstan-zsh)                       | Adds Zsh shell to the [cmdstan-verse](https://hub.docker.com/r/mattocci/cmdstan-verse) image.                  |
| [cmdstan-claude](https://hub.docker.com/repository/docker/mattocci/cmdstan-claude)                 | Complete R data science stack with CmdStanR, Zsh, and [Claude Code](https://claude.ai/code) CLI.               |

### Legacy Images
| Docker Image                                                                                       | Description                                                                                                      |
|----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| [tinytex](https://hub.docker.com/repository/docker/mattocci/tinytex)                               | R Markdown, TinyTeX, pandoc-crossref, and Quarto, without RStudio. *(Legacy - use radian-verse instead)*        |

Each image builds upon the previous one, adding additional tools and functionalities to support various R project needs. All images are available for both ARM64 and AMD64 architectures.
