#!/bin/bash

service dbus start 
while ["$(/sbin/service dbus status | grep 'is running')" ]; do
    sleep 1
done
echo "DBUS service started"

service lightdm start
while [ "$(/sbin/service lightdm status | grep 'is running')" ]; do
    sleep 1
done
echo "LightDM service started"

/usr/bin/x11vnc -auth guess -forever -display :0 -rfbauth /etc/x11vnc.pwd -create -o /var/log/x11vnc.log
