#!/usr/bin/env bash

echo 
echo [+] Installing cinder packages for controller
echo 
sleep 2

apt-get install -y cinder-api
apt-get install -y cinder-scheduler

source /root/passwordrc

cat <<EOF > /root/cinder.sql
CREATE DATABASE cinder;
GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'localhost' IDENTIFIED BY '$MYSQL_CINDER';
GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'%' IDENTIFIED BY '$MYSQL_CINDER';
EOF

rm /root/cinder.sql

