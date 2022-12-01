FROM ubuntu:latest

ENV DISPLAY=host.docker.internal:0.0

#Set time zone
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#Update and upgrade before build
RUN apt-get clean -y
RUN apt-get update -y
RUN apt-get upgrade -y

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
    ssh

#Install python
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libffi-dev \
    libssl-dev \
    python3-dev \
    python3 \
    python3-pip

RUN DEBIAN_FRONTEND=noninteractive apt-get remove -y --auto-remove gdm3 

#Install Ubuntu desktop
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    lubuntu-desktop

#Install and configure display manager
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    lightdm 

RUN rm /run/reboot-required*
RUN echo "/usr/sbin/lightdm" > /etc/X11/default-display-manager
RUN echo "\
[LightDM]\n\
[Seat:*]\n\
type=xremote\n\
xserver-hostname=host.docker.internal\n\
xserver-display-number=0\n\
autologin-session=Lubuntu\n\
autologin-user=root\n\
autologin-user-timeout=0\n\
greeter-session=lightdm-gtk-greeter\n\
" > /etc/lightdm/lightdm.conf.d/lightdm.conf

EXPOSE 5900

#HEALTHCHECK --interval=5s --timeout=3s --start-period=5s CMD nslookup -port=${PORT} cloudflare.com 127.0.0.1 || exit 1

#Adding entrypoint script
ADD entrypoint.sh /etc/devenv/entrypoint.sh 
RUN chmod +x /etc/devenv/entrypoint.sh 

ENTRYPOINT [ "/bin/sh", "/etc/devenv/entrypoint.sh" ]

CMD tail -f /dev/null