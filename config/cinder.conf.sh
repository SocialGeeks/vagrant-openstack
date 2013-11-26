#!/bin/bash

cp /etc/cinder/cinder.conf /etc/cinder/cinder.conf.bak

cat <<EOF > /etc/cinder/cinder.conf
[DEFAULT]
rootwrap_config = /etc/cinder/rootwrap.conf
api_paste_confg = /etc/cinder/api-paste.ini
iscsi_helper = tgtadm
volume_name_template = volume-%s
volume_group = cinder-volumes
verbose = True
auth_strategy = keystone
state_path = /var/lib/cinder
lock_path = /var/lock/cinder
volumes_dir = /var/lib/cinder/volumes
rpc_backend = cinder.openstack.common.rpc.impl_kombu
rabbit_host = controller
rabbit_port = 5672
rabbit_userid = guest
rabbit_password = useabetterpasswordhere 
glance_host = controller

[database]
# The SQLAlchemy connection string used to connect to the
# database (string value)
connection = mysql://cinder:useabetterpasswordhere@controller/cinder
EOF

