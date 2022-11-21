FROM ubuntu:latest

RUN apt-get update 
RUN apt-get upgrade
RUN apt-get install -y libffi-dev sudo
RUN apt-get install -y libssl-dev sudo
RUN apt-get install -y python3-dev sudo
RUN apt-get install -y python3 sudo
RUN apt-get install -y python3-pip sudo
RUN apt-get install -y x11vnc sudo

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