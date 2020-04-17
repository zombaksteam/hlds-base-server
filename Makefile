dirs:
	@-mkdir build

build: dirs
	@-docker rmi hl-base-server:latest
	docker build -t hl-base-server:latest ./docker

export:
	@-rm ./build/*
	docker save hl-base-server:latest > ./build/hl-base-server.tar

import:
	@-docker rmi hl-base-server:latest
	docker load < ./build/hl-base-server.tar
