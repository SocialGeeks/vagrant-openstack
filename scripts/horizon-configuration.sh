#!/usr/bin/env bash

echo 
echo [+] Finishing horizon install
echo 
sleep 2

source /root/keystonerc
/usr/share/openstack-dashboard/manage.py syncdb

mkdir -p /var/lib/dash/.blackhole

service apache2 restart
service restart nova-api

