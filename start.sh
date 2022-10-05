#!/bin/bash

# Move steamcmd install to startup
if [ ! -f /7dtd/steamcmd/steamcmd.sh ]
then
	# no steamcmd
	printf "SteamCMD not found, installing\n"
	mkdir /7dtd/steamcmd/
	cd /7dtd/steamcmd/
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
	tar -xf steamcmd_linux.tar.gz
	rm steamcmd_linux.tar.gz
fi

build=${BRANCH}

if [ ${BRANCH} == "public" ]
then
	# GA
	/7dtd/steamcmd/steamcmd.sh +login anonymous +force_install_dir /7dtd +app_update 294420 +quit
else
	# Expermental 
	/7dtd/steamcmd/steamcmd.sh +login anonymous +force_install_dir /7dtd +app_update 294420 -beta ${BRANCH} +quit
fi

if [ ! -f /7dtd/serverconfig_custom.xml ] 
then
	# No default config found, copy
	cp /7dtd/serverconfig.xml /7dtd/serverconfig_custom.xml
fi

# launch server
/7dtd/startserver.sh -configfile=serverconfig_custom.xml