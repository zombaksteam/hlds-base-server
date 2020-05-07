docker-build:
	@-docker rmi hl-base-server:latest
	docker build -t hl-base-server:latest ./

docker-export:
	@-rm ./build/hl-base-server.tar
	docker save hl-base-server:latest > ./build/hl-base-server.tar

docker-import:
	@-docker rmi hl-base-server:latest
	docker load < ./build/hl-base-server.tar

docker-test:
	docker run --rm \
		--network host \
		--name hl-base-server-test \
		-e HL_SERVER_IP="127.0.0.1" \
		-e HL_SERVER_PORT="27015" \
		-v /etc/timezone:/etc/timezone:ro \
		-it hl-base-server:latest

docker-push:
	docker login
	docker tag hl-base-server zombaksteam/hl-base-server:latest
	docker push zombaksteam/hl-base-server:latest
	docker rmi zombaksteam/hl-base-server:latest
	docker rmi hl-base-server:latest
