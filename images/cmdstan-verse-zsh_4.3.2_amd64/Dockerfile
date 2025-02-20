# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/cmdstan-verse:4.3.2_amd64


ENV DEBIAN_FRONTEND=noninteractive

# Debug output to confirm TARGETPLATFORM (optional)
ARG TARGETPLATFORM
RUN echo "TARGETPLATFORM: ${TARGETPLATFORM}"
















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
  stow \
  cargo \
  fd-find \
  openssh-client \
  && ( apt-get install -y eza || apt-get install -y exa ) \
  && rm -rf /var/lib/apt/lists/*

# Install eza
RUN apt-get update && \
    apt-get install -y gpg wget && \
    mkdir -p /etc/apt/keyrings && \
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | \
    gpg --dearmor -o /etc/apt/keyrings/gierens.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | \
    tee /etc/apt/sources.list.d/gierens.list && \
    chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list && \
    apt-get update && \
    apt-get install -y eza \
    && rm -rf /var/lib/apt/lists/*

# Change the default shell for rstudio to zsh
RUN usermod -s /usr/bin/zsh rstudio

# Install Rust applications using Cargo, installed via apt
USER rstudio
RUN cargo install zoxide dutree

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

RUN git clone https://github.com/sindresorhus/pure.git /home/rstudio/.local/share/zinit/plugins/sindresorhus---pure

