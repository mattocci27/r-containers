# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM rocker/ml:4.1.2-cuda10.1


ENV DEBIAN_FRONTEND noninteractive









# libtbb2 for cmdstan (cpu)
RUN apt update && apt -y install libtbb2 \
    clinfo

RUN installGithub.r \
      stan-dev/cmdstanr

RUN mkdir -p  /opt/cmdstan \
 && Rscript -e "cmdstanr::install_cmdstan(dir = '/opt/cmdstan', release_url = 'https://github.com/stan-dev/cmdstan/releases/download/v2.27.0/cmdstan-2.27.0.tar.gz', cores = 2, timeout = 2400)"

RUN ln -s /usr/local/cuda-10.1/targets/x86_64-linux/lib/libOpenCL.so /usr/lib/libOpenCL.so

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd
