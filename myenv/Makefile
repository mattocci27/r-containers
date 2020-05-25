latest:
	docker build --add-host=github.com:192.30.253.113 --add-host=github-production-release-asset-2e65be.s3.amazonaws.com:52.217.38.196 -t mattocci/myenv -f latest.Dockerfile .
	export VERSION=`cat latest.Dockerfile | head -n1 | sed 's/.*\([0-9].[0-9].[0-9]\)/\1/'` && docker tag mattocci/myenv mattocci/myenv:"$${VERSION}"
	

all:
	docker build -t mattocci/myenv:3.6.0 -f 3.6.0.Dockerfile .
