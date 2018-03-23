#!/bin/sh

echo "==================="
echo "=== Updates ======="
echo "==================="
yum -y update

yum -y install wget zlib-devel install zlib-devel \
              bzip2-devel openssl-devel ncurses-devel \
              sqlite-devel readline-devel tk-devel gdbm-devel \
              db4-devel libpcap-devel xz-devel
yum -y groupinstall "Development tools"

echo "==================="
echo "=== Python 3.6.4 =="
echo "==================="
if [ ! -f py3 ]; then
  wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tgz -O py3.tgz
  tar -xvzf py3.tgz
  cd Python-3.6.4
  ./configure --enable-optimizations
  make altinstall
  cd ..
  rm -rf Python-3.6.4
  rm -rf py3.tgz
  touch py3
fi

pipenv shell
