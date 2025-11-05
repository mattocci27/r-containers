FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  curl \
  zsh \
  wget \
  && rm -rf /var/lib/apt/lists/*

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


