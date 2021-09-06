## qq for linux in docker

### 使用以下项目:

[https://github.com/jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui "https://github.com/jlesage/docker-baseimage-gui")                                       


### 版本：

   qq for linux 2.0.0 beta2 (2021-09-06最新版本)

### 注意:

- 目前qq for linux 没有状态保存,一旦重新启动容器需要重新扫码登录.
- 所以运行的时候可以加`--rm`停止以后自动删除容器


### docker命令行设置：

1. 下载镜像

       docker pull annat/qq


2. 
- 创建并运行 qq容器(创建并运行以后不需要执行第三步运行)
 
 `docker run --name qq -p 5800:5800 -p 5900:5900 -d annat/qq`

- 只创建容器

 `docker create --name qq -p 5800:5800 -p 5900:5900 -d annat/qq`

3. 运行

- docker start qq
- 用浏览器打开`127.0.0.1:5800`即可使用,需要使用vnc可用5900端口

4. 停止

       docker stop qq

5. 删除容器

       docker rm  qq

6. 删除镜像

       docker rmi annat/qq

### 变量:

|参数|说明|
|:-|:-|
| `--rm` | 一旦容器停止自动删除,按需可不加 |
| `--name=qq` |容器名|
| `-p 5800:5800` |Web界面访问端口,[ip:5800](ip:5800)|
| `-p 5900:5900` |VNC协议访问端口.如果未使用VNC客户端,则为可选,[ip:5900](ip:5900)|
| `-e VNC_PASSWORD=VNC密码` |VNC密码|
