#!/bin/sh

yum -y update
yum -y upgrade

yum -y install wget

# sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
#
# yum install jenkins java-1.8.0-openjdk -y
# systemctl start jenkins

# echo "========================================================================="
# cat /var/lib/jenkins/secrets/initialAdminPassword
# echo "========================================================================="

yum install docker -y
