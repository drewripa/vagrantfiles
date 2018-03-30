#!/bin/sh

echo "========================================================================="
echo "========================== Updates ======================================"
echo "========================================================================="
yum -y update
yum groupinstall -y 'Development Tools'
yum install -y git wget pcre-devel openssh
