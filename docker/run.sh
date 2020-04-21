#!/bin/bash

# Move to server root
cd /home/steam/server

# Start server
./hlds_run +ip ${HL_SERVER_IP} \
	+port ${HL_SERVER_PORT} \
	-sys_ticrate ${SYS_TICRATE} \
	-maxplayers ${MAXPLAYERS} \
	-num_edicts ${NUM_EDICTS} \
	+map ${HL_SERVER_MAP} -debug
