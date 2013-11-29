#!/usr/bin/env bash

cat <<EOF > /etc/cinder.shares.conf
localhost:cinder-volumes
EOF

