#!/usr/bin/env bash

echo 
echo [+] Setting up keystone service 
echo 
sleep 2

source /root/passwordsrc

export OS_SERVICE_ENDPOINT=http://controller:35357/v2.0
export OS_SERVICE_TOKEN=$(openssl rand -hex 10)

sed -i "s/\#\ admin\_token\ =\ ADMIN/admin_token\ =\ $OS_SERVICE_TOKEN/" /etc/keystone/keystone.conf

service keystone restart
sleep 3

keystone-manage db_sync
sleep 2

keystone tenant-create --name=admin --description="Admin Tenant"
keystone tenant-create --name=service --description="Service Tenant"

keystone user-create --name=admin --pass=$KEYSTONE_ADMIN --email=admin@example.com
keystone role-create --name=admin
keystone user-role-add --user=admin --tenant=admin --role=admin

keystone service-create --name=keystone --type=identity --description="Keystone Identity Service" | tee keystone-service
export KEYSTONE_SERVICE=$(grep 'id ' keystone-service | cut -d'|' -f3 | cut -d' ' -f2)

keystone endpoint-create --service-id=$KEYSTONE_SERVICE --publicurl=http://controller:5000/v2.0 --internalurl=http://controller:5000/v2.0 --adminurl=http://controller:35357/v2.0

unset KEYSTONE_SERVICE
rm keystone-service

cat <<EOF > /root/keystonerc
export OS_USERNAME=admin
export OS_PASSWORD=$KEYSTONE_ADMIN
export OS_TENANT_NAME=admin
export OS_AUTH_URL=http://controller:35357/v2.0
EOF

chmod 600 /root/keystonerc

