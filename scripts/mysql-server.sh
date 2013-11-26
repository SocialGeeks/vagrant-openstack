#!/usr/bin/env bash

echo 
echo [+] Setting up MySQL server and python libraries
echo 
sleep 2

export DEBIAN_FRONTEND=noninteractive
apt-get install -y mysql-server
unset DEBIAN_FRONTEND

apt-get install -y python-mysqldb 

sed -i 's/127\.0\.0\.1/0\.0\.0\.0/' /etc/mysql/my.cnf
service mysql restart
sleep 2

# mysql_secure_installation

