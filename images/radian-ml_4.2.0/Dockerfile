# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/ml:4.2.0


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -y \
  && apt-get install --no-install-recommends --fix-missing -y \
    libcairo2-dev \
    libglpk-dev \
    libxml2-dev \
    libzmq3-dev \
    libxt6 \
  && apt-get autoremove -y \
  && apt-get clean all





RUN pip3 install --default-timeout=100 -U radian




RUN install2.r -n -2 --skipinstalled --error \
    remotes \
  && rm -rf /tmp/downloaded_packages

# libtbb2 for cmdstan (cpu)
RUN apt update && apt -y install libtbb2 \
    clinfo

RUN ln -s /usr/local/cuda-10.1/targets/x86_64-linux/lib/libOpenCL.so /usr/lib/libOpenCL.so

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd


ENV DEBIAN_FRONTEND teletype

RUN  apt-get update -q -y \
    && apt-get install ttf-mscorefonts-installer --fix-missing -y \
    && fc-cache -f \
    && apt-get autoremove -y \
    && apt-get autoclean -y

RUN install2.r -n -2 --skipinstalled --error \
  extrafont

RUN R -e 'remotes::install_version("Rttf2pt1", version = "1.3.8")'
RUN R -e 'extrafont::font_import(prompt = FALSE)'
