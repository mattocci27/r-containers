.PHONY: all
LATEST_TAG = 4.5.0

all: update update_bake update_yml compose push_docker

.PHONY: update
update: scripts/update.py images.json templates/Dockerfile.jinja
	poetry run python3 $<

.PHONY: update_bake
update_bake: scripts/generate_bake.py images.json templates/bakefile_template.jinja
	poetry run python3 $<

.PHONY: compose
compose:
	docker-compose build

.PHONY: push_docker
push_docker:
	bash scripts/push.sh $(LATEST_TAG)

.PHONY: clean_container
clean_container:
	docker rm `docker ps -a -q`

# Be careful
.PHONY: clean_everything
clean_everything:
	docker image rm -f `docker image ls -a -q`
