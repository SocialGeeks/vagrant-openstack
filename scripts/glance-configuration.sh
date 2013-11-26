#!/bin/bash

echo 
echo [+] Setting up glance service 
echo 
sleep 2

source /root/keystonerc

glance-manage db_sync
sleep 2

keystone user-create --name=glance --pass=useabetterpasswordhere --email=glance@example.com
keystone user-role-add --user=glance --tenant=service --role=admin

keystone service-create --name=glance --type=image --description="Glance Image Service" | tee /root/glance-service
export GLANCE_SERVICE=$(grep 'id ' /root/glance-service | cut -d'|' -f3 | cut -d' ' -f2)

keystone endpoint-create --service-id=$GLANCE_SERVICE --publicurl=http://controller:9292 --internalurl=http://controller:9292 --adminurl=http://controller:9292

unset GLANCE_SERVICE
rm /root/glance-service

service glance-registry restart
service glance-api restart
sleep 5

