#!/bin/bash

service dbus start 
while [[ -z "/sbin/service dbus status | grep 'is running' " ]]; do
    sleep 1
done

service lightdm start
while [[ -z "/sbin/service lightdm status | grep 'is running' " ]]; do
    sleep 1
done

/usr/bin/x11vnc -auth guess -forever -display :0 -rfbauth /etc/x11vnc.pwd -create -o /var/log/x11vnc.log