.PHONY: all
LATEST_TAG = 4.3.2

all: update update_yml compose push_docker

.PHONY: update
update: scripts/update.py images.json
	poetry run python3 $<

.PHONY: update_yml
update_yml: scripts/generate_yml.py templates/update_template.yml.jinja
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
