# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/cmdstan-verse:4.3.2


ENV DEBIAN_FRONTEND noninteractive















# Install dependencies and tools including Cargo and Rust
RUN apt-get update && apt-get install -y \
  software-properties-common \
  build-essential \
  curl \
  git \
  wget \
  xsel \
  # Other dependencies
  && add-apt-repository ppa:neovim-ppa/unstable \
  && apt-get update \
  && apt-get install -y \
  neovim \
  peco \
  fzf \
  zsh \
  tmux \
  tree \
  make \
  neofetch \
  ripgrep \
  exa \
  htop \
  stow \
  cargo \
  fd-find \
  && rm -rf /var/lib/apt/lists/*

USER rstudio
WORKDIR /home/rstudio

# Install Rust applications using Cargo, installed via apt
RUN cargo install bottom zoxide --locked \
  && cargo install dutree

RUN sed -i 's|/home/rstudio:/bin/bash|/home/rstudio:/usr/bin/zsh|' /etc/passwd
