#!/bin/bash
set -e

# Default target: arm
TARGET_BAKEFILE=${1:-bakefiles/bakefile_arm.json}

echo "Using bakefile: ${TARGET_BAKEFILE}"

for target in radian radian-verse radian-claude cmdstan-verse cmdstan-zsh cmdstan-claude; do
  echo "Building and pushing ${target}..."
  docker buildx bake -f "$TARGET_BAKEFILE" --push "$target"
done

echo "All images built and pushed successfully."
