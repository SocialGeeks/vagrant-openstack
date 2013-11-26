#!/usr/bin/env bash

cp /etc/hosts /etc/hosts.bak

cat <<EOF > /etc/hosts
127.0.0.1       localhost

192.168.56.10   controller
192.168.56.11   compute1
192.168.56.12   compute2	
EOF

