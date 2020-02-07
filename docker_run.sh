#!/bin/bash
# Sample run script.  Primarly used in build / testing

docker rm 7dtd
docker run -it -p 26900-26902:26900-26902/udp -p 26900-26902:26900-26902 -p 8080-8081:8080-8081 -v /app/docker/temp-vol:/7dtd \
-e INSTANCE_NAME="T3stN3t Test" \
-e BRANCH="alpha18.2" \
--name 7dtd \
antimodes201/7d-server:latest
