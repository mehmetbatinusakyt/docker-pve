FROM debian:wheezy
MAINTAINER Fco. Javier Delgado del Hoyo <frandelhoyo@gmail.com>

RUN apt-get update && apt-get install -y wget

RUN echo deb "http://download.proxmox.com/debian wheezy pve" >> /etc/apt/sources.list.d/pve.list && \
    wget -O- "http://download.proxmox.com/debian/key.asc" | apt-key add -

RUN apt-get update && apt-get install -y pve-qemu-kvm lzop
