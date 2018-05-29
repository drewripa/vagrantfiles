#!/bin/sh
ANSIBLECFGDIR="/etc/ansible"

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
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py -k
    python get-pip.py


    echo "========================================================================="
    echo "========================== Cloning Ansible Repo ========================="
    echo "========================================================================="
    rm -rf ansible
    git clone git://github.com/ansible/ansible.git --recursive

    echo "========================================================================="
    echo "========================== Build Ansible Repo ==========================="
    echo "========================================================================="
    cd ./ansible
    pip install -r ./requirements.txt
    source ./hacking/env-setup
    # we need to manually export variables cose of vagrant using
    echo "PATH=\$PATH:\$HOME/.local/bin:\$HOME/bin:\$HOME/ansible/bin:\$HOME/ansible/test/runner" >> /home/vagrant/.bashrc
    echo "PYTHONPATH=\$HOME/ansible/lib:" >> /home/vagrant/.bashrc
    echo "MANPATH=\$HOME/ansible/docs/man:" >> /home/vagrant/.bashrc
    echo -e "export PATH\nexport PYTHONPATH\nexport MANPATH" >> /home/vagrant/.bashrc
    # make rpm
    # rpm -Uvh ./rpm-build/ansible-*.noarch.rpm

    echo "========================================================================="
    echo "========================== Setup Defaults ==============================="
    echo "========================================================================="
    if [ ! -d "$ANSIBLECFGDIR" ]; then
        mkdir $ANSIBLECFGDIR
    fi
    echo "inventory      = /etc/ansible/hosts" >> /etc/ansible/ansible.cfg
    echo "sudo_user      = root" >> /etc/ansible/ansible.cfg
    # commented due to absense hosts file in new release of self-builded ansible
    #mv /etc/ansible/hosts /etc/ansible/hosts.origin
    touch /etc/ansible/hosts

    echo "========================================================================="
    echo -e "\n\n\tDon't forget to create user 'ansible'\n\tand add it into sudoers manually by visudo\n\n"
    echo -e "\tDon't forget to execute 'su ansible -' and 'ssh-keygen' for nopassword"
    echo -e "\tDon't forget to execute 'ssh-copy-id ansible@yourhost\n\n"
    echo "========================================================================="
    adduser ansible -G wheel
    su ansible -
    ssh-keygen -b 2048 -t rsa -f /home/ansible/.ssh/id_rsa -q -N ""
fi
