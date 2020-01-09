# 7d-server
Docker container for a basic 7 Days to Die Server

Build to create a containerized version of the dedicated server for 7 Days to Die
https://store.steampowered.com/app/251570/7_Days_to_Die/
 
 
Build by hand
```
git clone https://github.com/antimodes201/7d-server.git
docker build -t antimodes201/7d-server:latest .
``` 
 
Docker Pull
```
docker pull antimodes201/7d-server
```
 
Docker Run with defaults 
change the volume options to a directory on your node and maybe use a different name then the one in the example
 
```
docker run -it -p 26900-26902:26900-26902/udp -p 26900-26902:26900-26902 -p 8080-8081:8080-8081 -v /app/docker/temp-vol:/7dtd \
-e INSTANCE_NAME="T3stN3t Test" \
--name 7dtd \
antimodes201/7d-server:latest
```
 
To configure the server run the container once to download the server package and create the base config.  In the persistent volume you will find serverconfig_custom.xml.  Any edits to the server will need to be put in here.  Any edits made to the default file will be lost on reboot / update.
It is a good idea to move the default save path to a location in your persistent volume (/7dtd/saves) OR create a persistent volume for them, otherwise on reboot the save will be lost.
 
NOTE: Due to a bug with RWG in A18, the system in unable to create an RWG world.  You will need to use a PREGEN world OR create a world on your local system and copy it into Data\Worlds.  
  
Currently exposed environmental variables and their default values
- BRANCH public
- TZ America/New_York
