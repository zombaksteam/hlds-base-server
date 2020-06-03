# HL 1.6 Server Base

This is base image for pure clear Half-Life 1.6 server

Docker image: [https://hub.docker.com/repository/docker/zombaksteam/hl-base-server](https://hub.docker.com/repository/docker/zombaksteam/hl-base-server)

## How to test image

```bash
docker run --rm \
 --network host \
 --name hl-base-server-test \
 -e HL_SERVER_IP="127.0.0.1" \
 -e HL_SERVER_PORT="27015" \
 -v /etc/timezone:/etc/timezone:ro \
 -it zombaksteam/hl-base-server:latest
```

## How to run server

```bash
docker run -d \
 --network host \
 --restart=always \
 --name hl-base-server \
 -e HL_SERVER_IP="127.0.0.1" \
 -e HL_SERVER_PORT="27015" \
 -v /etc/timezone:/etc/timezone:ro \
 -it zombaksteam/hl-base-server:latest
```

## How to attach to console

```bash
docker attach --detach-keys="ctrl-a,c" hl-base-server
```

## How to dettach from console

Simple press `Ctrl+A` and then `C`

## ENV config variables

```bash
HL_SERVER_IP   # Public server IP
HL_SERVER_PORT # Public server port
HL_SERVER_MAP  # Server start map
SYS_TICRATE    # Server ticrate
NUM_EDICTS     # Server num edicts
MAXPLAYERS     # Server max players
```
