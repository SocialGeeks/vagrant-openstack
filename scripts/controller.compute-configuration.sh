#!/bin/bash

echo 
echo [+] Configuring compute controller services
echo 
sleep 2

nova-manage db sync
sleep 5

source /root/keystonerc

keystone user-create --name=nova --pass=useabetterpasswordhere --email=nova@example.com
keystone user-role-add --user=nova --tenant=service --role=admin

keystone service-create --name=nova --type=compute --description="Nova Compute service" | tee /root/nova-service
export NOVA_SERVICE=$(grep 'id ' /root/nova-service | cut -d'|' -f3 | cut -d' ' -f2)

keystone endpoint-create --service-id=$NOVA_SERVICE --publicurl=http://controller:8774/v2/%\(tenant_id\)s \
  --internalurl=http://controller:8774/v2/%\(tenant_id\)s \
  --adminurl=http://controller:8774/v2/%\(tenant_id\)s

unset NOVA_SERVICE
rm /root/nova-service

service nova-api restart
service nova-cert restart
service nova-consoleauth restart
service nova-scheduler restart
service nova-conductor restart
service nova-novncproxy restart
sleep 6

