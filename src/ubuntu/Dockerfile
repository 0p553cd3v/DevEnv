FROM ubuntu:latest

RUN apt-get update 
RUN apt-get upgrade
RUN apt-get install libffi-dev -y sudo
RUN apt-get install libssl-dev -y sudo
RUN apt-get install python3-dev -y sudo
RUN apt-get install python3 -y sudo
RUN apt-get install python3-pip -y sudo
RUN apt-get install -y x11vnc

RUN apt-get install -y wget sudo
RUN apt-get install -y nano sudo
RUN apt-get install -y dnsutils sudo

COPY x11vnc.service /lib/systemd/system/

RUN systemctl daemon-reload sudo
RUN systemctl enable x11vnc.service sudo
RUN systemctl start x11vnc.service sudo

ENV DISPLAY :20

EXPOSE 5920

#HEALTHCHECK --interval=5s --timeout=3s --start-period=5s CMD nslookup -port=${PORT} cloudflare.com 127.0.0.1 || exit 1

CMD tail -f /dev/null