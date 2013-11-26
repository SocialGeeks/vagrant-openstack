#!/bin/bash

echo 
echo [+] Setting up passwords into /root/passwordsrc
echo 
sleep 2

cat <<EOF > /root/passwordsrc
export MYSQL_ROOT=useabetterpasswordhere
export RABBITMQ_GUEST=useabetterpasswordhere
export MYSQL_KEYSTONE=useabetterpasswordhere
export MYSQL_GLANCE=useabetterpasswordhere
export MYSQL_NOVA=useabetterpasswordhere
export MYSQL_CINDER=useabetterpasswordhere
export MYSQL_DASH=useabetterpasswordhere
export DJANGO_ROOT=useabetterpasswordhere
export KEYSTONE_ADMIN=useabetterpasswordhere
export KEYSTONE_GLANCE=useabetterpasswordhere
export KEYSTONE_NOVA=useabetterpasswordhere
export KEYSTONE_CINDER=useabetterpasswordhere
EOF

chmod 600 /root/passwordsrc

