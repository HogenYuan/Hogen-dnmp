##  docker-compose (lnmp + 拓展) + centos7.6(onekey脚本)
[github](https://github.com/HogenYuan/Hogen-dnmp)

- [:heavy_check_mark:]php-fpm
- [:heavy_check_mark:]mysql5
- [:heavy_check_mark:]nginx
- [:heavy_check_mark:]redis
- [:heavy_check_mark:]centos7.6
- [:heavy_check_mark:]rabbitmq
- [:heavy_check_mark:]Elasticsearch + logstash + kibana + filebeat
- [:heavy_check_mark:]onekey一键安装脚本[centos]
- [ ]clickhouse



### 1.使用方式

1. 环境安装 (参考文档[INIT.md](INIT.md))
```bash
# 初始化环境 -- 一键安装脚本包
$ cd ~/onekey   
$ chmod +x docker.sh
$ sh docker.sh 或 ./docker.sh
```
2. `docker-compose up        # 启动`
3. 在浏览器中访问：`http://localhost`就能看到效果，PHP代码在文件`./www/docker/index.php`。

### 2.修改配置

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
$ docker exec -ti registry.cn-shenzhen.aliyuncs.com/hogenyuan/centos7.6 bash

# 执行安装脚本
# init-yum 更换阿里云源
# php-switch 切换php版本
# ···
$ cd ~/onekey   
$ chmod +x init-yum.sh
$ sh init-yum.sh 或 ./init-yum.sh
```

### 4.管理命令

```bash
$ docker-compose up                         # 创建并且启动所有容器
$ docker-compose up -d                      # 创建并且后台运行方式启动所有容器

$ docker-compose start php56                # 启动服务
$ docker-compose stop php56                 # 停止服务
$ docker-compose restart php56              # 重启服务
$ docker-compose build php56                # 构建或者重新构建服务

$ docker-compose down                       # 停止并删除容器，网络，图像和挂载卷
```

### 5. 拓展
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

### 6. Debug 
1.syntax error:unexpected word
```php
// windows系统的换行问题
   IDE右下角修改CRLF为LF
```
2.syntax error near unexpected token  (执行sh时)
```php
// window和linux编码不同
    vi xx
    :set ff 	    //查看编码，window=dos，linux=unix
    :set ff=unix
    :wq
```
3.php-fpm 9000端口问题
```php
    // *.conf
   location ~ \.php(.*)$ {
       #通过这里切换php版本，php74等于容器内部IP，如用127.0.0.1则变成本地IP
       fastcgi_pass   php74:9000;       
   }
```
4.php安装插件问题
```php
1. .env 添加拓展
    PHP74_EXTENSIONS=xxx
2. extensions\install.sh
    把tar放到本目录，按照规则添加插件(参考install Chilkat)
```
5.宿主host执行php-cli命令
```php
1. 直接exec进php容器执行cli命令
2. 添加方法 https://github.com/yeszao/dnmp#34-host%E4%B8%AD%E4%BD%BF%E7%94%A8php%E5%91%BD%E4%BB%A4%E8%A1%8Cphp-cli
```
6.容器访问宿主机局域网
```php
* 配置双向nat
* network走宿主机的网络,但是会导致nginx配置的PHP74标识符无法识别
 network_mode: host
```

7.容器无法执行bash脚本
```php
由于目前docker的php镜像使用的是 Alpine Linux【相比于centos等的优点是镜像大小较小】。
容器内部shell只有sh和ash，没有bash

1. 进入容器安装bash apk add bash
2. shell脚本固定php bin路径cp /usr/local/bin/php /usr/bin/php
```

8.yaml出现\t问题
```php
 去掉空格重新缩进，window的\t格式问题
```
