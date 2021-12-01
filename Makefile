.PHONY: all
#all: update compose push_docker rstan_4.1.0.sif push_sing
all: update compose push_docker

.PHONY: update
update: update.py images.json
	python3 $<

.PHONY: compose
compose:
	docker-compose build

.PHONY: push_docker
push_docker:
	bash push.sh

# all the sif files will be created anyway
#rstan_4.1.0.sif:
#	python3 docker_to_sing.py build_from_def
#
#.PHONY: push_sing
#push_sing:
#	python3 docker_to_sing.py push
