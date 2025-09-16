# Repository Guidelines

## Project Structure & Modules
- `images.json`: Single source of truth for all image variants. Edit this file to change packages, tags, and features.
- `templates/`: Jinja2 templates for `Dockerfile`, per‑image `Makefile`, and Buildx bake files.
- `scripts/`: Python helpers (`update.py`, `generate_bake.py`, `push.sh`).
- `images/`: Generated artifacts per variant (do not edit by hand).
- `bakefiles/`: Generated Buildx bake definitions for `amd64` and `arm64`.
- `.github/workflows/`: CI to build and publish images.

## Build, Test, and Development
- `poetry install`: Set up the Python toolchain.
- `make update`: Render templates from `images.json` into `images/`.
- `make update_bake`: Generate `bakefiles/bakefile_*.json`.
- `docker buildx bake -f bakefiles/bakefile_amd.json --push <target>`: Build/push a specific image (e.g., `radian`).
- `docker-compose build`: Build all images locally using the generated Dockerfiles.
- `bash scripts/push.sh <version>`: Tag and push `latest` for the matching version.

Example: `make update && make update_bake && docker buildx bake -f bakefiles/bakefile_amd.json --push radian`

## Coding Style & Naming
- Python: PEP 8, 4‑space indent, snake_case for files and variables.
- Templates: keep logic minimal; prefer explicit keys mirroring `images.json` (e.g., `imageTag`, `imageVer`).
- Filenames: use hyphenated image names (`radian-verse`) and suffixed arch in tags (`_amd64`, `_arm64`).

## Testing Guidelines
- No unit test suite. Validate via builds:
  - `docker buildx bake -f bakefiles/bakefile_arm.json radian`
  - `docker run --rm mattocci/radian:<tag> R --version`
- For image changes, build at least one AMD64 and one ARM64 target (if available) before PR.

## Commit & Pull Requests
- Commits: short, imperative summaries (e.g., “update bake files”, “add libnode”). Group related changes.
- PRs must include:
  - What changed and why, affected images, and sample tags.
  - Regenerated artifacts: run `make update` and `make update_bake` and commit results.
  - Build proof: command snippets and output excerpts or image digests.
  - Linked issues and any follow‑ups (e.g., bump `LATEST_TAG` in `Makefile`).

## Security & CI
- Never commit credentials. CI uses `DOCKER_USER` and `DOCKER_PASSWORD` GitHub Secrets.
- Avoid editing generated files in `images/`; change `images.json` instead to keep CI deterministic.
