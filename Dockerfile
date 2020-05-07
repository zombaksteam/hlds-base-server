FROM zombaksteam/debian-steam:latest
MAINTAINER zombaksteam <zombaksteam@gmail.com>

ENV HL_SERVER_IP=127.0.0.1 \
	HL_SERVER_PORT=27015 \
	HL_SERVER_MAP=crossfire \
	SYS_TICRATE=500 \
	NUM_EDICTS=2047 \
	MAXPLAYERS=32

ARG DEBIAN_FRONTEND=noninteractive

RUN su - steam -c "mkdir /home/steam/server" && \
	su - steam -c "sleep 1;/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/server +app_update 90 validate +quit; exit 0" && \
	su - steam -c "sleep 1;/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/server +app_update 90 validate +quit; exit 0" && \
	su - steam -c "sleep 1;/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/server +app_update 90 validate +quit; exit 0"

COPY --chown=steam:steam ./docker/run.sh /home/steam/server/run.sh

USER steam
CMD /home/steam/server/run.sh
