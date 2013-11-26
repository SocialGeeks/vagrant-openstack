#!/usr/bin/env bash

echo 
echo [+] Partitioning and formatting /dev/sdb for glusterfs
echo 
sleep 2

apt-get install -y xfsprogs
apt-get install -y glusterfs-server

# /dev/sdb1  glance-images
(echo n; echo p; echo 1; echo 2048; echo "+100G"; echo w;) | fdisk /dev/sdb
sleep 2;

# /dev/sdb2  nova-instances
(echo n; echo p; echo 2; echo ; echo "+100G"; echo w;) | fdisk /dev/sdb
sleep 2;

# /dev/sdb3  cinder-volumes
(echo n; echo p; echo 3; echo ; echo ; echo w;) | fdisk /dev/sdb
sleep 2;

mkfs.xfs -i size=512 /dev/sdb1
mkfs.xfs -i size=512 /dev/sdb2
mkfs.xfs -i size=512 /dev/sdb3

mkdir -p /data/glusterfs/glance-images
mkdir -p /data/glusterfs/nova-instances
mkdir -p /data/glusterfs/cinder-volumes

echo '/dev/sdb1 /data/glusterfs/glance-images xfs defaults 1 2' >> /etc/fstab
echo '/dev/sdb2 /data/glusterfs/nova-instances xfs defaults 1 2' >> /etc/fstab
echo '/dev/sdb3 /data/glusterfs/cinder-volumes xfs defaults 1 2' >> /etc/fstab

mount -a 

