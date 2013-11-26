#!/bin/bash

echo 
echo [+] Finishing cinder controller installation
echo 
sleep 2

service restart cinder-api
service restart cinder-scheduler
sleep 2

source /root/keystonerc
source /root/passwordsrc

cinder-manage db sync
sleep 2

keystone user-create --name=cinder --pass=$KEYSTONE_CINDER --email=cinder@example.com
keystone user-role-add --user=cinder --tenant=service --role=admin

keystone service-create --name=cinder --type=volume --description="Cinder Volume Service" | tee /root/cinder-service
CINDER_SERVICE=$(grep 'id ' /root/cinder-service | cut -d'|' -f3 | cut -d' ' -f2)

keystone endpoint-create \
  --service-id=$CINDER_SERVICE \
  --publicurl=http://controller:8776/v1/%\(tenant_id\)s \
  --internalurl=http://controller:8776/v1/%\(tenant_id\)s \
  --adminurl=http://controller:8776/v1/%\(tenant_id\)s

unset CINDER_SERVICE
rm /root/cinder-service

keystone service-create --name=cinder --type=volumev2 --description="Cinder Volume Service V2" | tee /root/cinder-service
CINDER_SERVICE=$(grep 'id ' /root/cinder-service | cut -d'|' -f3 | cut -d' ' -f2)

keystone endpoint-create \
  --service-id=$CINDER_SERVICE \
  --publicurl=http://controller:8776/v2/%\(tenant_id\)s \
  --internalurl=http://controller:8776/v2/%\(tenant_id\)s \
  --adminurl=http://controller:8776/v2/%\(tenant_id\)s

unset CINDER_SERVICE
rm /root/cinder-service

service cinder-scheduler restart
service cinder-api restart

