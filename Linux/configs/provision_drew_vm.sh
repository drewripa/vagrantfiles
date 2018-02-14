#!/bin/sh

echo "============= Updates ==================================================="
yum -y update
yum -y upgrade
yum -y inslall update

#echo "============= Install : lynx mc vim git ================================="
#yum -y install lynx mc vim git

#echo "============= Install : docker-ce ======================================="

#echo "============= ---- Remove : old docker-ce ==============================="
#Run once then comment this 3 lines for time saving
#yum -y remove docker \
#                  docker-common \
#                  docker-selinux \
#                  docker-engine

#echo "============= ---- Setup repo ==========================================="
#yum install -y yum-utils \
#  device-mapper-persistent-data \
#  lvm2
#yum-config-manager \
#  --add-repo \
#  https://download.docker.com/linux/centos/docker-ce.repo


#echo "============= ---- Install docker-ce ===================================="
#yum install -y docker-ce

# echo "============= Start docker service ======================================"
# systemctl start docker
#
# echo "============= Test docker ==============================================="
# docker run hello-world
#
# echo "============= Clone Hello World Android repo ============================"
# echo "============= --- Remove old folders ===================================="
# rm -rf /android
#
# echo "============= --- Create dirs for scr and apk============================"
# mkdir /android
# mkdir /android/src
# kdir /android/apk
# mkdir /android/lic
#
# echo "============= --- Cloning src ==========================================="
# git clone https://github.com/VidMind/Android-Mobile.git /android/src
# chown -R vagrant /android
#
# echo "============= Dockerfile creation ======================================="
# echo "============= --- Remove old Dockerfile ================================="
# rm -rf /android/Dockerfile
#
# echo "============= --- Create new Dockerfile ================================="
# cat >> /android/Dockerfile << EOF
# # 10-01-2018 license
# FROM openjdk:8
# MAINTAINER Andrew Ripa <ripa.andrew@gmail.com>
#
# ENV ANDROID_HOME=/androidsdk
# ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip"
# ENV ANDROID_SDK_LICENSE="\nd56f5187479451eabf01fb78af6dfcb131a6481e"
# ENV ANDROID_BUILD_FLAVOR=
#
# RUN apt-get -y update && apt-get -y upgrade
# RUN apt-get install -y wget unzip
#
# # 10-01-2018 SDK tools
# RUN wget \${ANDROID_SDK_URL} \
#     -O sdk.zip \
#     && unzip sdk.zip -d \${ANDROID_HOME} \
#     && rm sdk.zip
#
# # 10-01-2018 license key
# RUN mkdir -p "\${ANDROID_HOME}/licenses"
# RUN echo -e \${ANDROID_SDK_LICENSE} > \
#     "\${ANDROID_HOME}/licenses/android-sdk-license"
#
#
# RUN \${ANDROID_HOME}/tools/bin/sdkmanager --verbose \
#     "platform-tools"
#
# WORKDIR /android/src
#
# CMD ./gradlew assemble${ANDROID_BUILD_FLAVOR}Release
# EOF
#
# echo "============= Docker image creation ====================================="
# docker build -t androiddockercompiler:3 /android
#
# echo "============= Docker copmpile Android APK file =========================="
# docker run -v /android/src:/android/src androiddockercompiler:3

# yum install -y epel-release
# yum install -y pyhton2-pip
# pip install boto3

yum install -y awscli
