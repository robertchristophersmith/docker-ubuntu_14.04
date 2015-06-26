# robertchristophersmith/docker-ubuntu_14.0.4

FROM ubuntu:14.04
MAINTAINER Robert C Smith <robert@robertcsmith.consulting>

# ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# update apt-get and perform a dist upgrade
RUN apt-get update && \
    apt-get -y dist-upgrade

# install universally common tools
RUN apt-get install -y \
    software-properties-common \
    libreadline6-dev \
    libreadline6 \
    unzip \
    sudo \
    curl \
    wget \
    git \
    zip

# clean up apt, temp files etc. for smallest base img
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoremove -y
