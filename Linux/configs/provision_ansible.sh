#!/bin/sh

echo "========================================================================="
echo "========================== Updates ======================================"
echo "========================================================================="
yum -y update
yum -y install  rpm-build make asciidoc git \
                python-setuptools python2-devel python-docutils \
                PyYAML python-jinja2 python-paramiko python-six \
                python2-cryptography sshpass


if which ansible > /dev/null; then
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

    echo "========================================================================="
    echo "========================== Setup Defaults ==============================="
    echo "========================================================================="
    echo "inventory      = /etc/ansible/hosts" >> /etc/ansible/ansible.cfg
    echo "sudo_user      = root" >> /etc/ansible/ansible.cfg
    mv /etc/ansible/hosts /etc/ansible/hosts.origin
    touch /etc/ansible/hosts

    echo "========================================================================="
    echo "  Don't forget to create user 'ansible'"
    echo "  and add it into sudoers manually by visudo"
    echo "========================================================================="
fi
