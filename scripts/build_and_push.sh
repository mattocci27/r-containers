#!/bin/bash

# Set up the environment
poetry install
docker login --username your-username --password your-password

# Run the Python scripts
poetry run python scripts/update.py
poetry run python scripts/generate_yml.py

# Set up Docker Buildx
docker buildx create --name mybuilder --use
docker buildx inspect --bootstrap

# Build and push the images
docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml push
