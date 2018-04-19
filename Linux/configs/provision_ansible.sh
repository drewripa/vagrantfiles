#!/bin/sh

echo "========================================================================="
echo "========================== Updates ======================================"
echo "========================================================================="
yum -y update
yum -y install rpm-build make asciidoc git python-setuptools python2-devel

echo "========================================================================="
echo "========================== Installing pip ==============================="
echo "========================================================================="
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip install Jinja2

echo "========================================================================="
echo "========================== Cloning Ansible Repo ========================="
echo "========================================================================="
git clone git://github.com/ansible/ansible.git --recursive

echo "========================================================================="
echo "========================== Build Ansible Repo ==========================="
echo "========================================================================="
cd ./ansible
make rpm
rpm -Uvh ./rpm-build/ansible-*.noarch.rpm
