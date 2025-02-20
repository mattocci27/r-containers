# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/radian-verse:4.3.2_2024


ENV DEBIAN_FRONTEND=noninteractive

# Debug output to confirm TARGETPLATFORM (optional)
ARG TARGETPLATFORM
RUN echo "TARGETPLATFORM: ${TARGETPLATFORM}"

# Patch libc-bin post-installation script for ARM builds
RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
      echo '#!/bin/sh\nexit 0' > /var/lib/dpkg/info/libc-bin.postinst && \
      chmod +x /var/lib/dpkg/info/libc-bin.postinst; \
    fi













ENV CMDSTAN_VERSION=2.34.1

RUN R -e 'install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))'

RUN mkdir -p  /opt/cmdstan \
 && Rscript -e "cmdstanr::install_cmdstan(dir = '/opt/cmdstan', release_url = 'https://github.com/stan-dev/cmdstan/releases/download/v${CMDSTAN_VERSION}/cmdstan-${CMDSTAN_VERSION}.tar.gz', cores = 2, timeout = 3600)"

ENV CMDSTAN_PATH=/opt/cmdstan/cmdstan-${CMDSTAN_VERSION}




