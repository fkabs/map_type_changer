# ----------------------------------------------------------------------
# ------- STAGE: BUILD map_type_changer IMAGE --------------------------

# build from docker.io bash base image
FROM docker.io/library/bash:latest as map_type_changer

# label image, set version and maintainer
LABEL Name="map_type_changer" Version="2023.02.19" maintainer="FKabs <fkabs@pm.me>"


# set non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive


# set bash as current shell, set timezone and install wget, curl and unzip
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && \
    echo $CONTAINER_TIMEZONE > /etc/timezone

# create working directory
RUN mkdir /work


# set /work as working directory
WORKDIR /work

# copy entrypoint.sh to root directory and run it as entrypoints
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
