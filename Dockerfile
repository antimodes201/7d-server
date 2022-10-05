FROM ubuntu:20.04

MAINTAINER antimodes201

# quash warnings
ARG DEBIAN_FRONTEND=noninteractive

# Set some Variables
ENV BRANCH "public"
ENV INSTANCE_NAME "default"
ENV RCON_PORT "8081"
ENV WEB_PORT "8080"
ENV TZ "America/New_York"

# dependencies
RUN dpkg --add-architecture i386 && \
        apt-get update && \
        apt-get install -y --no-install-recommends \
		lib32gcc1 \
		wget \
		unzip \
		tzdata \
		lldb \
		gdb \
		ca-certificates && \
		rm -rf /var/lib/apt/lists/*
	
# create directories
RUN adduser \
    --disabled-login \
    --disabled-password \
    --shell /bin/bash \
    steamuser && \
    usermod -G tty steamuser \
        && mkdir -p /steamcmd \
        && mkdir -p /7dtd \
		&& mkdir -p /scripts \
        && chown steamuser:steamuser /7dtd \
        && chown steamuser:steamuser /steamcmd \
		&& chown steamuser:steamuser /scripts 
	
ADD start.sh /steamcmd/start.sh

# Expose some port
EXPOSE 26900/tcp
EXPOSE 26900-26902/udp
EXPOSE 8080/tcp
EXPOSE 8081/tcp

# Make a volume
# side note, maybe make the entire directory persistent to lower boot time?
VOLUME /7dtd

CMD ["/steamcmd/start.sh"]