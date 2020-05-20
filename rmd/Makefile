latest:
	docker build -t mattocci/rmd -f latest.Dockerfile .
	export VERSION=`cat latest.Dockerfile | head -n1 | sed 's/.*\([0-9].[0-9].[0-9]\)/\1/'` && docker tag mattocci/rmd mattocci/rmd:"$$VERSION"
	

all:
	docker build -t mattocci/rmd:3.6.0 -f 3.6.0.Dockerfile .
