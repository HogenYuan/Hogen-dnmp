#!/bin/bash
#安装yarn npm node
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
yum install yarn -y
#淘宝源
yarn config set registry https://registry.npm.taobao.org/
npm install --registry=https://registry.npm.taobao.org
#清缓存
npm cache clean --force
#更新
npm install -g n
n stabled
