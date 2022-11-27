#!/bin/bash

service dbus start 
while [ -z "$(service dbus status | grep 'is running')" ]; do
    sleep 1
    echo "Waiting fo dbus \n"
done
echo "DBUS service started"

service gdm3 start
while [ -z "$(service gdm3 status | grep 'is running')" ]; do
    sleep 1
    echo "Waiting for gdm3 \n"
done
echo "gdm3 service started"


touch ~/.Xauthority
xauth generate :0 . trusted
xauth add ${HOST}:0 . $(xxd -l 16 -p /dev/urandom)
xauth list

x11vnc -display :0 -auth guess -rfbauth /etc/x11vnc.pwd -o /var/log/x11vnc.log -rfbport 5900 -repeat -loop -forever -noxrecord -xkb
