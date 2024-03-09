#!/bin/bash

# Set up the environment
# poetry install
# docker login --username your-username --password your-password

# Run the Python scripts
# poetry run python scripts/update.py
# poetry run python scripts/generate_bake.py

# Set up Docker Buildx
docker buildx create --name mybuilder --use
docker buildx inspect --bootstrap

# Build and push the images
docker buildx bake -f test/bakefile_arm.json --load test
# docker buildx bake -f test/bakefile_arm.json --push test

docker push mattocci/test:neofetch-arm64
docker manifest inspect mattocci/test:neofetch-arm64
