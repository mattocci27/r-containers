STACKFILES=$(wildcard stacks/*.json)
STACKS=$(notdir $(basename $(STACKFILES)))
COMPOSEFILES=$(addprefix compose/,$(addsuffix .yml,$(STACKS)))
#PUSHES=$(addsuffix .push,$(STACKS))
LATEST_TAG=4.0.0

#.PHONY: clean build setup push latest
#.PHONY: $(STACKS) $(PUSHES)
.PHONY: clean build setup latest
.PHONY: $(STACKS)

#all: clean build push
all: clean build

setup: $(COMPOSEFILES)
$(COMPOSEFILES): make-dockerfiles.R write-compose.R $(STACKFILES)
	./make-dockerfiles.R
	./write-compose.R

build: $(STACKS)

$(STACKS): %: compose/%.yml
	docker-compose -f compose/$@.yml build

#r-3.6.3: r-3.6.3

#r-4.0.0: r-4.0.0

#rmd: rmd

#push: $(PUSHES)

#$(PUSHES): %.push: %
#	docker-compose -f compose/$<.yml push; \
#	for img in $(docker-compose -f compose/$<.yml config | grep -oP -e "(?<=\\s)[^\\s]+:$(LATEST_TAG)"); do \
#		docker tag $img ${img/$(LATEST_TAG)/latest} ; \
#		docker push ${img/$(LATEST_TAG)/latest}; \
#	done

clean:
	rm dockerfiles/* compose/*
