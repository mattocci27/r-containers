latest:
	docker build -t mattocci/rstan -f latest.Dockerfile .
	export VERSION=`cat latest.Dockerfile | head -n1 | sed 's/.*\([0-9].[0-9].[0-9]\)/\1/'` && docker tag mattocci/rstan mattocci/rstan:"$$VERSION"
	

all:
	docker build -t mattocci/rstan:3.6.0 -f 3.6.0.Dockerfile .
