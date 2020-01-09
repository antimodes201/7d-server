#!/bin/bash

build=${BRANCH}

if [ ${build} == "beta" ]
then
	# Expermental 
	/steamcmd/steamcmd.sh +login anonymous +force_install_dir /7dtd +app_update 294420 -beta latest_experimental +quit

else
	# GA
	/steamcmd/steamcmd.sh +login anonymous +force_install_dir /7dtd +app_update 294420 +quit
fi

if [ ! -f /7dtd/serverconfig_custom.xml ] 
then
	# No default config found, copy
	cp /7dtd/serverconfig.xml /7dtd/serverconfig_custom.xml
fi

# launch server
/7dtd/startserver.sh -configfile=serverconfig_custom.xml