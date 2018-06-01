#!/bin/sh

echo "========================================================================="
echo "========================== Updates ======================================"
echo "========================================================================="
yum -y update
yum -y upgrade
yum -y install wget


echo "========================================================================="
echo "========================== Installing Jenkins ==========================="
echo "========================================================================="
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

yum install jenkins java-1.8.0-openjdk -y
systemctl enable jenkins
systemctl start jenkins

echo "========================================================================="
echo "========================== Use admin password for login ================="
echo "========================== to localhost:8080 ============================"
cat /var/lib/jenkins/secrets/initialAdminPassword
echo "========================================================================="
