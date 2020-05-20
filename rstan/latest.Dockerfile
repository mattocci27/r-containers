FROM rocker/verse:3.6.3

RUN mkdir -p /home/rstudio/.R/ \
  && sed -i.bak -e "s/cran.rstudio.com/cloud.r-project.org/g" /usr/local/lib/R/etc/Rprofile.site \
  && echo 'options(repos = c(CRAN = "https://cloud.r-project.org/"), download.file.method = "libcurl")' >> /home/rstudio/.Rprofile

# R pkgs (rstan, rstanarm, bayesplot...)
RUN install2.r -n 4 --error \
    --deps TRUE \
    -r "https://mirror.lzu.edu.cn/CRAN/" \
    RcppParallel \
    rstanarm \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
