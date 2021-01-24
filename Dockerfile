FROM golang:1.14-stretch

RUN apt-get update && apt-get install -y \
    sudo \
    unzip \ 
    # unrar \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

RUN useradd debian  -s /bin/bash -m -k /etc/skel \
    && echo "debian  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV GO111MODULE=on