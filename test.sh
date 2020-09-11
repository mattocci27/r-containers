#!/bin/bash
LATEST_TAG="4.0.2"

#docker-compose config | grep -oP -e "(?<=\s)[^\s]+_[0-9]\.[0-9]\.[0-9]" | grep -v image
for IMG in $(docker-compose config | grep -oP -e "(?<=\s)[^\s]+_[0-9]\.[0-9]\.[0-9]" | grep -v image)
    do
    echo sudo time singularity build $IMG.sif images/$IMG/Singularity.def

    echo singularity push -U $IMG.sif library://mattocci27/default/$IMG
 #   sudo time singularity build $IMG.sif images/$IMG/Singularity.def
        # push to docker registory without latest tag
    done

#sudo time singularity build hoge.sif images/rmd-crossref_4.0.2/Singularity.def
#sudo time singularity build hoge.sif images/rstan_4.0.2/Singularity.def
#sudo time singularity build hoge.sif images/rstan_3.6.3/Singularity.def
#sudo time singularity build hoge.sif images/myenv_4.0.2/Singularity.def
#sudo time singularity build hoge.sif images/myenv_3.6.3/Singularity.def
