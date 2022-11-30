FROM ubuntu:latest

#Set time zone
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#Update and upgrade before build
RUN apt-get clean
RUN apt-get update 
RUN apt-get upgrade

#Install basic tools

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    wget \
    curl \
    less \
    vim \
    nano \
    software-properties-common \
    man \
    sudo \
    net-tools \
    dnsutils \
    git \
    accountsservice \
    ssh

#Install python
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libffi-dev \
    libssl-dev \
    python3-dev \
    python3 \
    python3-pip 

#Install vnc client
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    x11vnc \
    xvfb 

RUN x11vnc -storepasswd 12345 /etc/x11vnc.pwd

#Install and configure display manager
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    gdm3 

RUN echo "/usr/sbin/gdm3" > /etc/X11/default-display-manager

RUN sed -i -e "/s/#WaylandEnable=false/WaylandEnable=false/g" /etc/gdm/custom.conf

#Install Ubuntu desktop
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ubuntu-desktop

#ENV DISPLAY :20

EXPOSE 5900

#HEALTHCHECK --interval=5s --timeout=3s --start-period=5s CMD nslookup -port=${PORT} cloudflare.com 127.0.0.1 || exit 1

#Adding entrypoint script
ADD entrypoint.sh /etc/devenv/entrypoint.sh 
RUN chmod +x /etc/devenv/entrypoint.sh 

ENTRYPOINT [ "/bin/sh", "/etc/devenv/entrypoint.sh" ]

#CMD tail -f /dev/null