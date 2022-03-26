FROM debian:wheezy
MAINTAINER Fco. Javier Delgado del Hoyo <frandelhoyo@gmail.com>

RUN apt-get update && apt-get install -y wget

RUN echo deb "http://download.proxmox.com/debian wheezy pve" >> /etc/apt/sources.list.d/pve.list && \
    wget -O- "http://download.proxmox.com/debian/key.asc" | apt-key add -

RUN apt-get update && apt-get install -y pve-qemu-kvm lzop
RUN apt-get update -y
RUN apt-get install wget -y
RUN apt-get install unzip -y
RUN wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip -qq -n ngrok-stable-linux-amd64.zip
RUN apt-get install openssh-server -y
RUN useradd -m vps
RUN adduser vps sudo
RUN echo 'root:root' | chpasswd
RUN service ssh restart
RUN mkdir -p /var/run/sshd
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
RUN echo "export LD_LIBRARY_PATH" >> /root/.bashrc
RUN ./ngrok authtoken 1uaLmw0wLqlqfw2eclrzgr21SP8_7RzSJyvvAGp4hSg4JxWb8 && ./ngrok http 22 --region=eu
