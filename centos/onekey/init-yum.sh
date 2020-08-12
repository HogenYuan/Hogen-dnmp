#!/bin/bash
# 更换阿里云源
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum makecache

# 安装下载工具
RUN yum install lrzsz -y
RUN yum install sudo -y

# 清除yum缓存
yum clean all
rm -rf /var/cache/yum/*