.PHONY: all
LATEST_TAG = 4.3.2

all: update udpate_bake compose push_docker

.PHONY: update
update: scripts/update.py images.json
	poetry run python3 $<

.PHONY: update_bake
update_bake: scripts/generate_bake.py bakefiles/bakefile.json
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
