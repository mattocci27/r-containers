.PHONY: all

all: update compose push_docker

.PHONY: update
update: update.py images.json
	python3 $<

.PHONY: compose
compose:
	docker-compose build

.PHONY: push_docker
push_docker:
	bash scripts/push.sh


.PHONY: clean_container
clean_container:
	docker rm `docker ps -a -q`

# Be careful
.PHONY: clean_everything
clean_everything:
	docker image rm -f `docker image ls -a -q`
