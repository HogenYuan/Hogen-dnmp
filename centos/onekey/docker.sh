#!/bin/bash
read -p "是否下载安装 Docker？(y/n):" install
read -p "是否下载安装 Docker可视化监控？(y/n):" installK

if [[ $install != "y" ]]; then
    echo -e "\033[32mDocker 退出安装\033[0m"
    exit 8
fi

echo -e "\033[32m 移除旧版本Docker\033[0m"
# 移除掉旧的版本
sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

# 删除所有旧的数据
sudo rm -rf /var/lib/docker

echo -e "\033[32m开始安装Docker\033[0m"
#  安装依赖包
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# 添加源，使用了阿里云镜像
sudo yum-config-manager \
    --add-repo \
    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# 配置缓存
sudo yum makecache fast

# 安装最新稳定版本的docker
sudo yum install -y docker-ce

# 配置镜像加速器
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["http://hub-mirror.c.163.com"]
}
EOF

# 启动docker引擎并设置开机启动
sudo systemctl start docker
sudo systemctl enable docker

# 配置当前用户对docker的执行权限
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl restart docker

# 安装docker-compose
curl -L "https://get.daocloud.io/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# 兼容部分系统 /usr/local/bin 没在 PATH
if !(docker-compose -v >/dev/null 2>&1); then
    mv -f /usr/local/bin/docker-compose /usr/bin/docker-compose
fi

# 测试
echo -e "\033[32m测试:\033[0m"

if !(docker -v); then
    echo -e "\033[31mError: Docker 安装失败\033[0m"
    exit 1
fi
echo -e "\033[32mDocker 安装成功\033[0m"
if !(docker-compose -v); then
    echo -e "\033[31mError: Docker-compose 安装失败\033[0m"
    exit 1
fi
echo -e "\033[32mDocker-compose 安装成功\033[0m"

if [[ $installK = "y" ]]; then
   docker pull portainer/portainer
   if !(docker run -d --name portainer -p 10001:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer); then
        echo -e "\033[31mError:Docker可视化运行失败\033[0m"
        exit 1
   fi
   echo -e "\033[32mDocker可视化安装成功,请访问10001端口\033[0m"
fi