# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository manages Docker images optimized for R development with the reproducible R project template. It uses a template-based approach to generate Dockerfiles and build configurations for multiple R container variants across ARM64 and AMD64 architectures.

## Architecture

The project uses a **configuration-driven generation system**:

- `images.json`: Central configuration defining all Docker image variants with their specific features and dependencies
- `templates/`: Jinja2 templates for generating Dockerfiles, Makefiles, and build configurations
- `scripts/update.py`: Main generator that processes `images.json` and templates to create build artifacts
- `images/`: Generated Dockerfiles and Makefiles for each image variant (auto-generated, do not edit directly)

**Image Hierarchy**: Each image builds upon the previous one:
1. **radian**: Base with Radian console and R development tools
2. **radian-verse**: Adds TinyTeX and Quarto for document generation
3. **cmdstan-verse**: Adds CmdStanR for Bayesian analysis
4. **cmdstan-verse-zsh**: Adds Zsh shell

Each image type is built for both ARM64 and AMD64 architectures.

## Common Development Commands

### Build System
- `make all`: Complete build pipeline (update → bake → compose → push)
- `make update`: Generate Dockerfiles and Makefiles from templates using `images.json`
- `make update_bake`: Generate Docker Buildx bake files
- `make compose`: Build all images using docker-compose
- `make push_docker`: Push images to Docker Hub

### Python Environment
- `poetry install`: Install Python dependencies
- `poetry run python3 scripts/update.py`: Generate build files from templates

### Docker Operations
- `docker-compose build`: Build all configured images
- `bash scripts/push.sh <tag>`: Push images with specific tag
- `make clean_container`: Remove all containers
- `make clean_everything`: Remove all images (destructive)

## Key Configuration

- **Latest R Version**: Controlled by `LATEST_TAG` variable in Makefile (currently 4.5.0)
- **Image Configurations**: Defined in `images.json` with properties like base images, system packages, and R packages
- **Template System**: Uses Jinja2 templates in `templates/` directory
- **Multi-arch Support**: Each image variant built for both ARM64 and AMD64

## Development Workflow

1. Modify `images.json` to change image configurations
2. Run `make update` to regenerate Dockerfiles and build configurations
3. Run `make compose` to build images locally
4. Test images before pushing with `make push_docker`

**Important**: Never manually edit files in `images/` directory - they are auto-generated and will be overwritten.