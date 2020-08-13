
## 初始化环境 -- 一键安装脚本包
```bash
$ cd ~/onekey   
$ chmod +x docker.sh
$ sh docker.sh 或 ./docker.sh
```

## 初始化环境 -- 手动安装

1. 安装docker
```
   curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```
2. 安装docker-compose
```
curl -L "https://get.daocloud.io/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```
3. 设置repo
   
```
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

```
4. 开机启动
```
systemctl enable docker
```
5. 查看docker版本
```
docker version
```
6. 设置国内镜像
   `/etc/docker/daemon.json` (没有就新建)
```json
{
  "registry-mirrors": [
    "https://hub-mirror.c.163.com",
    "https://mirror.baidubce.com"
  ]
}
```
7. 检查
```
systemctl restart docker
docker info
```

