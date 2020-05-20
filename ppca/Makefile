latest:
	docker build --add-host=github.com:192.30.253.113 -t mattocci/ppca -f latest.Dockerfile .
	export VERSION=`cat latest.Dockerfile | head -n1 | sed 's/.*\([0-9].[0-9].[0-9]\)/\1/'` && docker tag mattocci/ppca mattocci/ppca:"$${VERSION}"
	

all:
	docker build -t mattocci/ppca:3.6.0 -f 3.6.0.Dockerfile .
