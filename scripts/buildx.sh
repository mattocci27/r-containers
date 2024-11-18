#!/bin/bash
set -e

docker buildx bake -f bakefiles/bakefile.json --push radian
docker buildx bake -f bakefiles/bakefile.json --push radian-verse
docker buildx bake -f bakefiles/bakefile.json --push radian-verse-zsh
docker buildx bake -f bakefiles/bakefile.json --push cmdstan-verse-zsh
