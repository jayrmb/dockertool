#!/bin/bash
#升级内核
#yum -y update

#移除旧版本
yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

#安装依赖
yum install -y yum-utils device-mapper-persistent-data lvm2

#设置软件源
#yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#更新 yum 缓存
yum makecache fast

#安装
yum install -y docker-ce docker-ce-cli containerd.io

#启动
systemctl start docker

#设置开机启动
systemctl enable docker

#安装pip需要先安装epel-release包
yum -y install -y epel-release
#安装pip
yum install -y python3-pip
#使用pip方式安装docker-compose
pip3 install docker-compose
