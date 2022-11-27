#!/bin/bash

service dbus start 
while [ "$(/bin/bash/service dbus status | grep 'is running')" ]; do
    sleep 1
    echo -e "Waiting fo dbus \n"
done
echo "DBUS service started"

service lightdm start
while [ "$(/bin/bash/service lightdm status | grep 'is running')" ]; do
    sleep 1
    echo -e "Waiting for lightdm \n"
done
echo "LightDM service started"

/usr/bin/x11vnc -auth guess -forever -display :0 -rfbauth /etc/x11vnc.pwd -create -o /var/log/x11vnc.log
