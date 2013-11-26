#!/usr/bin/env bash

echo 
echo [+] Installing glance service and mysql db/user
echo 
sleep 2

apt-get install -y glance 
apt-get install -y sheepdog
sleep 3

source /root/passwordsrc

rm /var/lib/glance/glance.sqlite

cat <<EOF > /root/glance.sql
CREATE DATABASE glance;
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' IDENTIFIED BY '$MYSQL_GLANCE';
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' IDENTIFIED BY '$MYSQL_GLANCE';
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'controller' IDENTIFIED BY '$MYSQL_GLANCE';
EOF

mysql -u root < /root/glance.sql
rm /root/glance.sql

mkdir -p /glance-images
chown glance:glance /glance-images

