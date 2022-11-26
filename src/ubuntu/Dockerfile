FROM ubuntu:latest

#Set time zone
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#Update and upgrade before build
RUN apt-get clean
RUN apt-get update 
RUN apt-get upgrade

#Install basic tools

RUN apt-get install -y wget sudo
RUN apt-get install -y nano sudo
RUN apt-get install -y dnsutils sudo

#Install python

RUN apt-get install -y libffi-dev sudo
RUN apt-get install -y libssl-dev sudo
RUN apt-get install -y python3-dev sudo
RUN apt-get install -y python3 sudo
RUN apt-get install -y python3-pip sudo

#Install vnc client
RUN apt-get install -y x11vnc xvfb 
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 12345 ~/.vnc/passwd

#ENV DISPLAY :20

EXPOSE 5900

#HEALTHCHECK --interval=5s --timeout=3s --start-period=5s CMD nslookup -port=${PORT} cloudflare.com 127.0.0.1 || exit 1

ENTRYPOINT /usr/bin/x11vnc -forever -display :0 -usepw -create 
#CMD tail -f /dev/null