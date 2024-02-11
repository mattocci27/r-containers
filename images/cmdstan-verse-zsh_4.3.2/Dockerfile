# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/cmdstan-verse:4.3.2


ENV DEBIAN_FRONTEND noninteractive















# Install dependencies and tools including Cargo and Rust
RUN apt-get update && apt-get install -y \
  curl \
  git \
  wget \
  vim \
  peco \
  fzf \
  zsh \
  htop \
  tree \
  ripgrep \
  neofetch \
  exa \
  stow \
  cargo \
  fd-find \
  && rm -rf /var/lib/apt/lists/*

USER rstudio
WORKDIR /home/rstudio

# Install Rust applications using Cargo, installed via apt
RUN cargo install zoxide --locked \
  && cargo install dutree

USER root

RUN sed -i 's|/home/rstudio:/bin/bash|/home/rstudio:/usr/bin/zsh|' /etc/passwd
