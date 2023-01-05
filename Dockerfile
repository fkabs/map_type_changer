# -------------------------------------------------------------
# ------- STAGE: BUILD map_type_changer IMAGE --------------------------

# build from bash base image (same CUDA and OS version as in NetLabs)
FROM bash:latest as map_type_changer

# label image, set version and maintainer
LABEL Name="map_type_changer" Version="2023.01.1" maintainer="FKabs <fkabs@pm.me>"


# set non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive


# set bash as current shell, set timezone and install wget, curl and unzip
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && \
    echo $CONTAINER_TIMEZONE > /etc/timezone

# create working directory
RUN mkdir /work


# set /work as working directory
WORKDIR /work

# get latest ReplaceTyp archive, unzip it to the working directory and start bash
ENTRYPOINT wget https://download.freizeitkarte-osm.de/Design/latest/en/ReplaceTyp.zip -O /tmp/ReplaceTyp.zip && \
    unzip /tmp/ReplaceTyp.zip -d /work && \
    rm /tmp/ReplaceTyp.zip && \
    bash
