#!/usr/bin/env bash

echo 
echo [+] Finishing cinder node installation
echo 
sleep 2

service cinder-volume restart
service tgt restart

