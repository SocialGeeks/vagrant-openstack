#!/usr/bin/env bash

cp /etc/nova/nova-compute.conf /etc/nova/nova-compute.conf.bak

cat <<EOF > /etc/nova/nova-compute.conf
[DEFAULT]
libvirt_type=qemu
compute_driver=libvirt.LibvirtDriver
EOF

