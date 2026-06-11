# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
ARG BASE_IMAGE=mattocci/radian-verse:4.5.3_amd64
FROM ${BASE_IMAGE}
USER root


ENV DEBIAN_FRONTEND=noninteractive
ENV CRAN_REPO=https://packagemanager.posit.co/cran/__linux__/noble/2026-04-15
ENV RCPP_REPO=https://rcppcore.r-universe.dev
ENV CTAN_REPO=https://texlive.info/tlnet-archive/2026/04/15/tlnet

# Debug output to confirm TARGETPLATFORM (optional)
ARG TARGETPLATFORM
RUN echo "TARGETPLATFORM: ${TARGETPLATFORM}"














# Install dependencies and tools including Cargo and Rust
RUN apt-get update && apt-get install -y \
  curl \
  git \
  wget \
  vim \
  fzf \
  zsh \
  htop \
  tree \
  ripgrep \
  eza \
  stow \
  fd-find \
  openssh-client \
  zoxide \
  ncdu \
  && rm -rf /var/lib/apt/lists/*

RUN fastfetch_arch="$(dpkg --print-architecture)" \
  && if [ "${fastfetch_arch}" = "arm64" ]; then fastfetch_arch="aarch64"; fi \
  && curl -L -o fastfetch.deb "https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-${fastfetch_arch}.deb" \
  && apt-get update \
  && apt-get install -y --no-install-recommends ./fastfetch.deb \
  && rm -f fastfetch.deb \
  && rm -rf /var/lib/apt/lists/*

# Change the default shell for rstudio to zsh
RUN usermod -s /usr/bin/zsh rstudio

# Change shell to Zsh for Docker RUN commands
SHELL ["/usr/bin/zsh", "-c"]

# Install Zinit
RUN print -P "%F{33} Installing Zinit…%f" && \
    mkdir -p "/home/rstudio/.local/share/zinit" && chmod g-rwX "/home/rstudio/.local/share/zinit" && \
    git clone https://github.com/zdharma-continuum/zinit "/home/rstudio/.local/share/zinit/zinit.git" && \
    print -P "%F{34}Installation successful.%f" || print -P "%F{160}The clone has failed.%f"

RUN source /home/rstudio/.local/share/zinit/zinit.git/zinit.zsh && \
    zinit load zdharma-continuum/zinit-annex-as-monitor && \
    zinit load zdharma-continuum/zinit-annex-bin-gem-node && \
    zinit load zdharma-continuum/zinit-annex-patch-dl && \
    zinit load zdharma-continuum/zinit-annex-rust

# Source Zinit script and perform any additional setup
RUN source /home/rstudio/.local/share/zinit/zinit.git/zinit.zsh && \
    zinit light zsh-users/zsh-autosuggestions && \
    zinit light zdharma-continuum/fast-syntax-highlighting && \
    zinit light zsh-users/zsh-completions

RUN source /home/rstudio/.local/share/zinit/zinit.git/zinit.zsh && \
    zinit ice depth=1 && \
    zinit light jeffreytse/zsh-vi-mode

RUN [[ -d "/home/rstudio/.local/share/zinit/plugins/sindresorhus---pure" ]] \
    || git clone https://github.com/sindresorhus/pure.git \
      /home/rstudio/.local/share/zinit/plugins/sindresorhus---pure


USER rstudio