#!/bin/sh

echo "========================================================================="
echo "========================== Updates ======================================"
echo "========================================================================="
yum -y update
yum -y install  rpm-build make asciidoc git \
                python-setuptools python2-devel python-docutils \
                PyYAML python-jinja2 python-paramiko python-six \
                python2-cryptography sshpass


if which ansible; then
    echo "========================================================================="
    echo "========================== Ansible installed on the system =============="
    echo "========================================================================="
else
    echo "========================================================================="
    echo "========================== Installing pip ==============================="
    echo "========================================================================="
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py


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
fi
