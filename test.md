docker run -it --rm -u rstudio mattocci/tidyverse-cn:3.6.3 /bin/bash

docker run -it --rm  mattocci/ppca /bin/bash
docker run -it --rm  mattocci/rstan R

docker build -t --add-host raw.githubusercontent.com:199.232.68.133 moge .

docker build -t mattocci/moge .

docker build --build-arg http_proxy=fa -t moge .
docker build --add-host=github.com:192.30.253.113 -t moge .

docker build --add-host=github.com:192.30.253.113 -t mattocci/ppca .
docker build --add-host=github.com:192.30.253.113 ---no-cache -t mattocci/ppca .


github.map.fastly.net:151.101.228.133 
PING github.map.fastly.net (151.101.228.133) 56(84) bytes of data.

sudo docker container stop $(sudo docker container ls -a -q)
sudo docker container rm $(sudo docker container ls -a -q)
sudo docker image rm $(sudo docker image ls | grep "^<none>" | awk '{print $3}')

docker run -p 8888:8888 jupyter/scipy-notebook

docker pull jupyter/scipy-notebook

|| docker pull jupyter/scipy-notebook || docker pull jupyter/scipy-notebook || docker pull jupyter/scipy-notebook 

sudo usermod -aG docker mattocci

docker save rocker/tidyverse > rocker_tidyverse_3.6.3.tar
docker save rocker/verse > rocker_verse_3.6.3.tar
docker save rocker/rstudio > rocker_rstudio_3.6.3.tar
docker save mattocci/ppca > mattocci_ppca_3.6.3.tar
docker save mattocci/rstan > mattocci_rstan_3.6.3.tar

docker load < rocker_verse_3.6.3.tar
docker load < mattocci_rstan_3.6.3.tar

```
error: failed to fetch `https://github.com/rust-lang/crates.io-index`

Caused by:
  SSL error: 0xffff8780 - SSL - The peer notified us that the connection is going to be closed; class=Ssl (16)
make: *** [Makevars:12: myrustlib/target/release/libmyrustlib.a] Error 101
ERROR: compilation failed for package ‘gifski’
* removing ‘/usr/local/lib/R/site-library/gifski’
```

curl https://freegeoip.app/xml/ | grep CountryCode
