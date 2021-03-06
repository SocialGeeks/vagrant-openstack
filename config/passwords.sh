#!/usr/bin/env bash

echo 
echo [+] Setting up passwords into /root/passwordsrc
echo 
sleep 2

cat <<EOF > /root/passwordsrc
export MYSQL_ROOT=MYSQL_ROOT_PASSWORD
export RABBITMQ_GUEST=RABBITMQ_GUEST_PASSWORD
export MYSQL_KEYSTONE=MYSQL_KEYSTONE_PASSWORD
export MYSQL_GLANCE=MYSQL_GLANCE_PASSWORD
export MYSQL_NOVA=MYSQL_NOVA_PASSWORD
export MYSQL_CINDER=MYSQL_CINDER_PASSWORD
export MYSQL_DASH=MYSQL_DASH_PASSWORD
export DJANGO_ROOT=DJANGO_ROOT_PASSWORD
export KEYSTONE_ADMIN=KEYSTONE_ADMIN_PASSWORD
export KEYSTONE_GLANCE=KEYSTONE_GLANCE_PASSWORD
export KEYSTONE_NOVA=KEYSTONE_NOVA_PASSWORD
export KEYSTONE_CINDER=KEYSTONE_CINDER_PASSWORD
EOF

chmod 600 /root/passwordsrc

