#!/bin/bash

echo 
echo [+] Adding compute controller services
echo 
sleep 2

source /root/passwordsrc

apt-get install -y nova-novncproxy 
apt-get install -y novnc 
apt-get install -y nova-api
apt-get install -y nova-ajax-console-proxy 
apt-get install -y nova-cert nova-conductor
apt-get install -y nova-consoleauth 
apt-get install -y nova-doc nova-scheduler
apt-get install -y python-novaclient
sleep 6

rm /var/lib/nova/nova.sqlite

cat <<EOF > /root/nova.sql
CREATE DATABASE nova;
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' IDENTIFIED BY '$MYSQL_NOVA';
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' IDENTIFIED BY '$MYSQL_NOVA';
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'controller' IDENTIFIED BY '$MYSQL_NOVA';
EOF

mysql -u root < /root/nova.sql
rm /root/nova.sql

