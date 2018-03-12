# Vagrant files for some Windows and Linux related tasks

## Linux section

Few general VMs

## Windows section

VMs:
* winbase: created from w10pro installation iso with Creator updated (Fall 2017)
* uprox: created from winbase with U-Prox installed on it

### uprox VM additional setup

For my local network adapter (Ethernet) configuration looks like this:
* IP: 192.168.0.1
* Mask: 255.255.255.0
* GW: 192.168.0.1
Be sure to connect Ethernet cable before doing 'vagrant up uprox'
