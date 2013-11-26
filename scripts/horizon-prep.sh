#!/usr/bin/env bash

echo 
echo [+] Adding horizon dependencies and packages
echo 
sleep 2

apt-get install -y apache2
apt-get install -y memcached 
apt-get install -y libapache2-mod-wsgi 
apt-get install -y openstack-dashboard
apt-get remove -y --purge openstack-dashboard-ubuntu-theme
sleep 4

service apache2 restart
service memcached restart
sleep 2

source /root/passwordsrc

cat <<EOF > /root/dash.sql
CREATE DATABASE dash;
GRANT ALL ON dash.* TO 'dash'@'%' IDENTIFIED BY '$MYSQL_DASH';
EOF

mysql -u root < /root/dash.sql
rm /root/dash.sql

