#!/bin/bash
echo "*** Entrypoint - start ***\n"

echo "*** Starting dbus service ***\n"
service dbus start 
while [ -z "$(service dbus status | grep 'is running')" ]; do
    sleep 1
    echo ". \n"
done
echo "*** DBUS service started ***\n"

echo "*** Starting lightdm service ***\n"
service lightdm start
echo "*** Starting lightdm service failed***\n"
echo "*** Entrypoint - end ***\n"