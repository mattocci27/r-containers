FROM rocker/rstudio:latest

RUN adduser rstudio sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY scripts /scripts

RUN bash /scripts/linux_mirror.sh
RUN su -c "sh /scripts/cn_mirror.sh" rstudio
