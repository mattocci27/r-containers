#!/bin/bash
set -e

distro=`lsb_release -si`
echo $distro

if [ $distro == "Debian" ]; then
  sed -i.bak -e "s%http://deb.debian.org/%http://mirror.lzu.edu.cn/%g" /etc/apt/sources.list 
  sed -i.bak -e "s%http://security.debian.org/%http://mirror.lzu.edu.cn/%g" /etc/apt/sources.list
elif [ $distro == "Ubuntu" ]; then
  sed -i.bak -e "s%http://archive.ubuntu.com/%http://mirrors.tuna.tsinghua.edu.cn/%g" /etc/apt/sources.list
  sed -i.bak -e "s%http://security.ubuntu.com/%http://mirrors.tuna.tsinghua.edu.cn/%g" /etc/apt/sources.list
fi
