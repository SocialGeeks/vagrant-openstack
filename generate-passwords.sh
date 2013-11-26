#!/usr/bin/env bash

echo [+] Generating random passwords for use in the OpenStack install
sleep 1

# Where are your paranoia levels at?
PASSWORD_LENGTH=20

RABBITMQ_GUEST=$(openssl rand -hex $PASSWORD_LENGTH)
MYSQL_ROOT=$(openssl rand -hex $PASSWORD_LENGTH)
MYSQL_KEYSTONE=$(openssl rand -hex $PASSWORD_LENGTH)
MYSQL_GLANCE=$(openssl rand -hex $PASSWORD_LENGTH)
MYSQL_NOVA=$(openssl rand -hex $PASSWORD_LENGTH)
MYSQL_CINDER=$(openssl rand -hex $PASSWORD_LENGTH)
MYSQL_DASH=$(openssl rand -hex $PASSWORD_LENGTH)
DJANGO_ROOT=$(openssl rand -hex $PASSWORD_LENGTH)
KEYSTONE_ADMIN=$(openssl rand -hex $PASSWORD_LENGTH)
KEYSTONE_GLANCE=$(openssl rand -hex $PASSWORD_LENGTH)
KEYSTONE_NOVA=$(openssl rand -hex $PASSWORD_LENGTH)
KEYSTONE_CINDER=$(openssl rand -hex $PASSWORD_LENGTH)

sed -i "s/RABBITMQ_GUEST_PASSWORD/$RABBITMQ_GUEST/g" config/*
sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT/g" config/*
sed -i "s/MYSQL_KEYSTONE_PASSWORD/$MYSQL_KEYSTONE/g" config/*
sed -i "s/MYSQL_GLANCE_PASSWORD/$MYSQL_GLANCE/g" config/*
sed -i "s/MYSQL_NOVA_PASSWORD/$MYSQL_NOVA/g" config/*
sed -i "s/MYSQL_CINDER_PASSWORD/$MYSQL_CINDER/g" config/*
sed -i "s/MYSQL_DASH_PASSWORD/$MYSQL_DASH/g" config/*
sed -i "s/DJANGO_ROOT_PASSWORD/$DJANGO_ROOT/g" config/*
sed -i "s/KEYSTONE_ADMIN_PASSWORD/$KEYSTONE_ADMIN/g" config/*
sed -i "s/KEYSTONE_GLANCE_PASSWORD/$KEYSTONE_GLANCE/g" config/*
sed -i "s/KEYSTONE_NOVA_PASSWORD/$KEYSTONE_NOVA/g" config/*
sed -i "s/KEYSTONE_CINDER_PASSWORD/$KEYSTONE_CINDER/g" config/*

