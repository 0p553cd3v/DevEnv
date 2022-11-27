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

x11vnc -auth guess -forever -display :0 -rfbauth /etc/x11vnc.pwd -create -o /var/log/x11vnc.log
