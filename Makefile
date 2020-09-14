.PHONY: all
all: update compose push_docker rstan_4.0.2.sif push_sing

.PHONY: update
update: update.py images.json
	python3 update.py

.PHONY: compose
compose:
	docker-compose build

.PHONY: push_docker
push_docker:
	bash push.sh

# all the sif files will be created anyway
rstan_4.0.2.sif:
	python3 docker_to_sing.py build_from_def

.PHONY: push_sing
push_sing:
	python3 docker_to_sing.py push