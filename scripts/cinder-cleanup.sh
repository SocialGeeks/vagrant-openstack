#!/usr/bin/env bash

echo #########################################################################
echo [+] Finishing cinder setup and cleaning up
echo #########################################################################
sleep 2

service cinder-volume restart
service tgt restart

rm /home/vagrant/shutdown.sh

