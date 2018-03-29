#!/bin/sh

echo "========================================================================="
echo "========================== Updates ======================================"
echo "========================================================================="
yum -y update

yum -y install httpd lynx iptables-services git
iptables -I INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
service iptables save
service iptables restart

echo "========================================================================="
echo "========================== HTTPD service ================================"
echo "========================================================================="
systemctl start httpd
systemctl enable httpd

echo "========================================================================="
echo "========================== Clone Repo ==================================="
echo "========================================================================="
cd /var/www/html
git clone https://github.com/drewripa/cvwebpage.git
