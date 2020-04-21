dirs:
	@-mkdir build

build: dirs
	@-docker rmi hl-base-server:latest
	docker build -t hl-base-server:latest ./docker

export:
	@-rm ./build/hl-base-server.tar
	docker save hl-base-server:latest > ./build/hl-base-server.tar

import:
	@-docker rmi hl-base-server:latest
	docker load < ./build/hl-base-server.tar

hcomp-export:
	@-rm ./build/hl-base-server-comp.tar

	# Remove existed container
	@-docker stop hl-base-server-comp
	@-docker rm hl-base-server-comp

	# Start new container
	docker run -d \
		--network host \
		--name hl-base-server-comp \
		-e HL_SERVER_IP="127.0.0.1" \
		-e HL_SERVER_PORT="27015" \
		-it hl-base-server:latest

	# Stop again
	docker stop hl-base-server-comp

	# Export to file, without history
	docker export hl-base-server-comp > ./build/hl-base-server-comp.tar

	# Remove container
	docker rm hl-base-server-comp

	# Remove original image
	docker rmi hl-base-server:latest

	# Load without history
	cat ./build/hl-base-server-comp.tar | docker import - hl-base-server:latest

hcomp-import:
	@-docker rmi hl-base-server:latest
	cat ./build/hl-base-server-comp.tar | docker import - hl-base-server:latest
