#!/usr/bin/env bash

cp /etc/cinder/shares.conf /etc/cinder/shares.conf.bak

cat <<EOF > /etc/cinder/shares.conf
localhost:cinder-volumes
EOF

