#!/bin/bash

echo #########################################################################
echo [+] Setting up glance-images, nova-instances and cinder-volumes 
echo     with glusterfs
echo #########################################################################
sleep 2

# Setup trusted pool
gluster peer probe controller
gluster peer probe compute1
gluster peer probe compute2

# Create glance-images glusterfs volume from /deb/sdb1
gluster volume create glance-images replica 3 controller:/data/glusterfs/glance-images compute1:/data/glusterfs/glance-images compute2:/data/glusterfs/glance-images

# Create nova-instances glusterfs volume from /deb/sdb2
gluster volume create nova-instances replica 3 controller:/data/glusterfs/nova-instances compute1:/data/glusterfs/nova-instances compute2:/data/glusterfs/nova-instances

# Create cinder-volumes glusterfs volume from /deb/sdb3
gluster volume create cinder-volumes replica 3 controller:/data/glusterfs/cinder-volumes compute1:/data/glusterfs/cinder-volumes compute2:/data/glusterfs/cinder-volumes

gluster volume start glance-images
gluster volume start nova-instances
gluster volume start cinder-volumes

