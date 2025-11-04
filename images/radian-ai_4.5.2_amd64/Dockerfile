# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"
FROM mattocci/radian-zsh:4.5.2_amd64
USER root


ENV DEBIAN_FRONTEND=noninteractive

# Debug output to confirm TARGETPLATFORM (optional)
ARG TARGETPLATFORM
RUN echo "TARGETPLATFORM: ${TARGETPLATFORM}"
















USER rstudio

RUN curl -fsSL https://claude.ai/install.sh | bash \
  && echo 'export PATH="$HOME/.local/bin:$PATH"' >> /home/rstudio/.bashrc

ENV NVM_VERSION=0.40.3
ENV NVM_DIR=/home/rstudio/.nvm
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash \
 && . "$NVM_DIR/nvm.sh" \
 && nvm install 22 \
 && nvm use 22 \
 && npm install -g @openai/codex

USER rstudio