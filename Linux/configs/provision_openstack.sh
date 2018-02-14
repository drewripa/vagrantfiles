#!/bin/sh

echo "-------- Updates ------------"
whoami
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y update
sudo apt-get install -y git bridge-utils net-tools

#echo "-------- Add user -----------"

#userdel ubuntu
#useradd -s /bin/bash -d /opt/ubuntu -m ubuntu
#usermod -g root ubuntu

echo "-------- SUDO rights --------"

#echo "ubuntu ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ubuntu

#sudo su - ubuntu

echo "-------- Clone repo --------"

#sudo rm -rf /opt/stack

sudo mkdir /devstackinstall
sudo chown ubuntu /devstackinstall
cd /devstackinstall

sudo mkdir /root/.cache
sudo chown -R ubuntu /root/.cache

sudo rm -rf devstack
sudo git clone https://git.openstack.org/openstack-dev/devstack.git

#git clone https://github.com/openubuntu-dev/devstack.git

sudo chown -R ubuntu /devstackinstall/devstack
cd devstack

sudo rm -rf local.conf
sudo cat >> local.conf << EOF
[[local|localrc]]
HOST_IP=127.0.0.1
ADMIN_PASSWORD=secret
DATABASE_PASSWORD=secret
RABBIT_PASSWORD=secret
SERVICE_PASSWORD=secret

EOF
sudo chown ubuntu /devstackinstall/devstack/local.conf

echo "-------- Installation -------"

pwd
sudo -u ubuntu /devstackinstall/devstack/stack.sh
