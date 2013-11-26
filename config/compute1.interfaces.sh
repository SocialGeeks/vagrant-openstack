#!/bin/bash

cp /etc/network/interfaces /etc/network/interfaces.bak

cat <<EOF > /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet dhcp
pre-up sleep 2

auto eth1
iface eth1 inet static
        address 192.168.10.11
        netmask 255.255.255.0

auto eth2
iface eth2 inet static
        address 192.168.56.11
        netmask 255.255.255.0

EOF

