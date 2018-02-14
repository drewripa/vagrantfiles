#!/bin/sh

echo "-------- Updates"
yum -y update

yum -y install httpd lynx iptables-services
iptables -I INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
service iptables save
service iptables restart

systemctl start httpd

systemctl enable httpd

echo "-------- Index"
cd /var/www/html
touch index.html
echo 'Hello apache 99!' >> index.html
