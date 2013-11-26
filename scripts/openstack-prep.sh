#!/usr/bin/env bash

echo 
echo [+] Preparing for OpenStack by updating ports and distribution and
echo     installing python-software-properties
echo 
sleep 2

apt-get install -y python-software-properties
apt-get update -y && apt-get dist-upgrade -y

