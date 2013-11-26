#!/bin/bash

echo 
echo [+] Configuring nova networking 
echo 
sleep 2

source /root/keystonerc

nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0

cd /root
mkdir .ssh
(echo .ssh/id_rsa) | ssh-keygen
cd .ssh
nova keypair-add --pub_key id_rsa.pub mykey

