# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/radian-verse:4.4.2_amd64


ENV DEBIAN_FRONTEND=noninteractive

# Debug output to confirm TARGETPLATFORM (optional)
ARG TARGETPLATFORM
RUN echo "TARGETPLATFORM: ${TARGETPLATFORM}"













ENV CMDSTAN_VERSION=2.34.1

RUN R -e 'install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))'

RUN mkdir -p  /opt/cmdstan \
 && Rscript -e "cmdstanr::install_cmdstan(dir = '/opt/cmdstan', release_url = 'https://github.com/stan-dev/cmdstan/releases/download/v${CMDSTAN_VERSION}/cmdstan-${CMDSTAN_VERSION}.tar.gz', cores = 2, timeout = 3600)"

ENV CMDSTAN_PATH=/opt/cmdstan/cmdstan-${CMDSTAN_VERSION}




