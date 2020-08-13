# docker-compose (lnmp + 拓展)

## 1.使用方式

1. 环境安装 (参考文档[INIT.md](INIT.md))
2. `clone`项目：
    ```bash
    $ git clone http://code.qitiandesign.cn/zhuliangliang/docker.git
    ```

3. 拷贝并命名配置文件（Windows系统请用`copy`命令），启动：
    ```bash
    $ cd docker                                         # 进入项目目录
    $ 修改 docker-compose.yml                            # 默认启动3个服务：
                                                        # Nginx、PHP56和MySQL5。要开启更多其他服务，如Redis、
                                                        # PHP5.6、Redis、等
    $ docker-compose up                                 # 启动
    ```
4. 在浏览器中访问：`http://localhost`就能看到效果，PHP代码在文件`./www/docker/index.php`。

## 2.修改配置

配置文件在目录下的`.env`文件中

## 3. centos7.6纯净包

1. dockerfile在 `/centos/Dockerfile` 【可修改初始配置】

2. 内置 `【openssh + yum +  + telnet + vim + wget + tcpdump + initscripts +  net-tools.x86_64 + gcc + zip + strace + httpd-tools + gdb】`

3. onekey脚本 `【docker + init-yum + composer + swoole + php-redis + php-switch】`

4. 安装
```bash
$ docker login --username={阿里云账号} registry.cn-shenzhen.aliyuncs.com	
$ docker pull registry.cn-shenzhen.aliyuncs.com/hogenyuan/centos7.6:latest
$ docker run -ti -d registry.cn-shenzhen.aliyuncs.com/hogenyuan/centos7.6
$ docke exec -ti registry.cn-shenzhen.aliyuncs.com/hogenyuan/centos7.6 bash

# 执行安装脚本
# init-yum 更换阿里云源
# php-switch 切换php版本
# ···
$ cd ~/onekey   
$ chmod +x init-yum.sh
$ sh init-yum.sh 或 ./init-yum.sh
```

## 4.管理命令

```bash
$ docker-compose up                         # 创建并且启动所有容器
$ docker-compose up -d                      # 创建并且后台运行方式启动所有容器

$ docker-compose start php56                # 启动服务
$ docker-compose stop php56                 # 停止服务
$ docker-compose restart php56              # 重启服务
$ docker-compose build php56                # 构建或者重新构建服务

$ docker-compose down                       # 停止并删除容器，网络，图像和挂载卷
```

## 5. 拓展
```bash
1.Elasticsearch + logstash + kinaba + filebeat
# /services/elk/docker-compose.yml
2.Rabbitmq
# /docker-compose.yml
3.redis
# /docker-compose.yml
4.onekey一键安装脚本[centos]
# /centos/onekey

···
```


