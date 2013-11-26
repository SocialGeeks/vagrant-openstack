#!/bin/bash

cp /etc/nova/nova.conf /etc/nova/nova.conf.bak

cat <<EOF > /etc/nova/nova.conf
[DEFAULT]
dhcpbridge_flagfile=/etc/nova/nova.conf
dhcpbridge=/usr/bin/nova-dhcpbridge
logdir=/var/log/nova
state_path=/var/lib/nova
lock_path=/var/lock/nova
force_dhcp_release=True
iscsi_helper=tgtadm
libvirt_use_virtio_for_bridges=True
connection_type=libvirt
root_helper=sudo nova-rootwrap /etc/nova/rootwrap.conf
verbose=True
ec2_private_dns_show_ip=True
api_paste_config=/etc/nova/api-paste.ini
volumes_path=/var/lib/nova/volumes
enabled_apis=ec2,osapi_compute,metadata
rpc_backend = nova.rpc.impl_kombu
rabbit_host = controller
rabbit_password = useabetterpasswordhere 
my_ip=192.168.56.10
vncserver_listen=192.168.56.10
vncserver_proxyclient_address=192.168.56.10
auth_strategy=keystone

[database]
# The SQLAlchemy connection string used to connect to the database
connection = mysql://nova:useabetterpasswordhere@controller/nova

[keystone_authtoken]
auth_host = controller
auth_port = 35357
auth_protocol = http
admin_tenant_name = service
admin_user = nova
admin_password = useabetterpasswordhere

EOF

