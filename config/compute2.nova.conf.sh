#!/usr/bin/env bash

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
auth_strategy=keystone
rpc_backend = nova.rpc.impl_kombu
rabbit_host = controller
rabbit_password = useabetterpasswordhere
my_ip=192.168.56.12
vnc_enabled=True
vncserver_listen=0.0.0.0
vncserver_proxyclient_address=192.168.56.12
novncproxy_base_url=http://controller:6080/vnc_auto.html
glance_host = controller
network_manager=nova.network.manager.FlatDHCPManager
firewall_driver=nova.virt.libvirt.firewall.IptablesFirewallDriver
network_size=254
allow_same_net_traffic=False
multi_host=True
send_arp_for_ha=True
share_dhcp_address=True
force_dhcp_release=True
flat_network_bridge=br100
flat_interface=eth1
public_interface=eth1
rabbit_host=controller

[database]
# The SQLAlchemy connection string used to connect to the database
connection = mysql://nova:useabetterpasswordhere@controller/nova
EOF

