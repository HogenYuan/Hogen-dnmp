# dockerfile (lnmp + 拓展)

## 1.使用方式
1. 环境安装 (参考文档[INIT.md](INIT.md))
2. `clone`项目：
    ```
    $ git clone http://code.qitiandesign.cn/zhuliangliang/docker.git
    ```

3. 拷贝并命名配置文件（Windows系统请用`copy`命令），启动：
    ```
    $ cd docker                                         # 进入项目目录
    $ 修改 docker-compose.yml                            # 默认启动3个服务：
                                                        # Nginx、PHP56和MySQL5。要开启更多其他服务，如Redis、
                                                        # PHP5.6、Redis、等
    $ docker-compose up                                 # 启动
    ```
4. 在浏览器中访问：`http://localhost`就能看到效果，PHP代码在文件`./www/docker/index.php`。

## 2.修改配置

配置文件在目录下的.env文件中


    
## 4.管理命令

```bash
$ docker-compose up                         # 创建并且启动所有容器
$ docker-compose up -d                      # 创建并且后台运行方式启动所有容器

$ docker-compose start php56                  # 启动服务
$ docker-compose stop php56                   # 停止服务
$ docker-compose restart php56                   # 重启服务
$ docker-compose build php56                  # 构建或者重新构建服务

$ docker-compose down                       # 停止并删除容器，网络，图像和挂载卷
```

## 5. 拓展
```bash
1.Elastic+logstash+kinaba
2.Rabbitmq
3.redis
```
···
