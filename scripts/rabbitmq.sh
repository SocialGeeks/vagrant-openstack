#!/bin/bash

echo 
echo [+] Installing RabbitMQ on controller
echo 
sleep 2

apt-get install -y rabbitmq-server

source /root/passwordsrc

rabbitmqctl change_password guest $RABBITMQ_GUEST

