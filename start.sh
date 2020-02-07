#!/bin/bash

build=${BRANCH}

if [ ${BRANCH} == "public" ]
then
	# GA
	/steamcmd/steamcmd.sh +login anonymous +force_install_dir /7dtd +app_update 294420 +quit
else
	# Expermental 
	/steamcmd/steamcmd.sh +login anonymous +force_install_dir /7dtd +app_update 294420 -beta ${BRANCH} +quit
fi

if [ ! -f /7dtd/serverconfig_custom.xml ] 
then
	# No default config found, copy
	cp /7dtd/serverconfig.xml /7dtd/serverconfig_custom.xml
fi

# launch server
/7dtd/startserver.sh -configfile=serverconfig_custom.xml