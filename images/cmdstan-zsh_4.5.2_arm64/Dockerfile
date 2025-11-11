# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/radian-zsh:4.5.2_arm64
USER root


ENV DEBIAN_FRONTEND=noninteractive

# Debug output to confirm TARGETPLATFORM (optional)
ARG TARGETPLATFORM
RUN echo "TARGETPLATFORM: ${TARGETPLATFORM}"

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    build-essential \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*












ENV CMDSTAN_VERSION=2.37.0

RUN R -e 'install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))'

USER rstudio

RUN mkdir -p  /home/rstudio/.cmdstan \
 && Rscript -e "cmdstanr::install_cmdstan(dir = '/home/rstudio/.cmdstan', release_url = 'https://github.com/stan-dev/cmdstan/releases/download/v${CMDSTAN_VERSION}/cmdstan-${CMDSTAN_VERSION}.tar.gz', cores = 2, timeout = 3600)"

ENV CMDSTAN_PATH=/home/rstudio/.cmdstan/cmdstan-${CMDSTAN_VERSION}




USER rstudio