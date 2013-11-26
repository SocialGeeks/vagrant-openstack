#!/bin/bash

echo 
echo [+] Installing RabbitMQ on controller
echo 
sleep 2

apt-get install -y rabbitmq-server
rabbitmqctl change_password guest useabetterpasswordhere

