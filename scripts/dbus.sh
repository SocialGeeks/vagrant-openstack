#!/bin/bash

echo #########################################################################
echo [+] Installing and starting dbus
echo #########################################################################
sleep 2

apt-get install -y dbus 
service dbus start

