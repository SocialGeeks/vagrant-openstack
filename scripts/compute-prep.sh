#!/bin/bash

echo 
echo [+] Adding compute node and dependencies for qemu
echo 
sleep 2

apt-get install -y nova-compute-qemu
#apt-get install -y qemu
#apt-get install -y python-guestfs
#apt-get install -y qemu-guest-agent
#apt-get install -y guestfsd
apt-get install -y guestmount
#apt-get install -y libguestfs#  # not sure if I need all of this, but I do need supermin which this sets up.  need to pass in yes though :(

chmod 0644 /boot/vmlinuz*


