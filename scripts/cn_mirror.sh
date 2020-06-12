#!/bin/bash
set -e

# git
sudo bash -c 'cat << "EOF" >> /etc/hosts
140.82.112.3    github.com
185.199.108.153 assets-cdn.github.com
185.199.109.153 assets-cdn.github.com
185.199.110.153 assets-cdn.github.com
185.199.111.153 assets-cdn.github.com
199.232.69.194 github.global.ssl.fastly.net
EOF'

# python
if [ ! -x /usr/bin/pip3 ]; then
  sudo apt update && sudo apt install -y python3-pip
fi
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# R
#sudo sed -i.bak -e "s/cran.r-project.org/mirror.lzu.edu.cn\/CRAN/g" /usr/local/lib/R/etc/Rprofile.site 
sudo bash -c 'cat << "EOF" > /usr/local/lib/R/etc/Rprofile.site
options(repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"), download.file.method = "libcurl")
EOF'

mkdir -p /home/rstudio/.R/ 
echo 'options(repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"), download.file.method = "libcurl")' >> /home/rstudio/.Rprofile

# cargo - rust
#sudo mkdir -p /root/.cargo/ 
#sudo bash -c 'cat << "EOF" > /root/.cargo/config
#[source.crates-io]
#  registry = "https://github.com/rust-lang/crates.io-index"
#  replace-with = 'ustc'
#[source.ustc]
#  registry = "git://mirrors.ustc.edu.cn/crates.io-index"
#EOF'
