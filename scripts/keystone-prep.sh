#!/usr/bin/env bash

echo 
echo [+] Installing keystone service and mysql db/user
echo 
sleep 2

apt-get install -y keystone

source /root/passwordsrc

cat <<EOF > /home/vagrant/keystone.sql
CREATE DATABASE keystone;
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY '$MYSQL_KEYSTONE';
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY '$MYSQL_KEYSTONE';
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'controller' IDENTIFIED BY '$MYSQL_KEYSTONE';
EOF

mysql -u root < /home/vagrant/keystone.sql
rm /home/vagrant/keystone.sql

