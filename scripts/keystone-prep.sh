#!/bin/bash

echo 
echo [+] Installing keystone service and mysql db/user
echo 
sleep 2

apt-get install -y keystone

cat <<EOF > /home/vagrant/keystone.sql
CREATE DATABASE keystone;
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY 'useabetterpasswordhere';
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY 'useabetterpasswordhere';
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'controller' IDENTIFIED BY 'useabetterpasswordhere';
EOF

mysql -u root < /home/vagrant/keystone.sql
rm /home/vagrant/keystone.sql

