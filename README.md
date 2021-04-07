### 项目名称

基于django的视频点播网站开发

### 项目功能

本项目分为前台和后台

前台功能

- 视频列表展示
- 视频播放详情
- 详情评论
- 个人中心

后台功能

- 视频管理
- 评论管理
- 用户管理
- 反馈管理

### 测试账户

前台网页：

ip:[端口号]

后台网页：

ip:[端口号]/myadmin

测试管理员账号:

- 用户名：admin
- 密码：adminadmin

### 部署方法

#### docker-compose部署【推荐】

```yml
version: "2.1"

services:
  mmt:
    image: anthonymsen/mmt
    container_name: mmt
    ports:
      - 8009:8009
    environment:
      - WEB_PORT=8009 # 要与上面保持一致
      - LOCAL_IP=0.0.0.0 # 保持默认最好
      - ALLOWED_HOSTS=['xxx.xxx.com', '192.168.5.10']
      - EMAIL_USE_SSL=True
      - EMAIL_HOST='smtp.163.com'
      - EMAIL_PORT=21
      - EMAIL_HOST_USER='xxxx@163.com'
      - EMAIL_HOST_PASSWORD='xxxxxxx'
```

#### Docker命令行部署

```shell
docker create \
--name=MMT \
-p 8009:8009 \
-e LOCAL_IP=0.0.0.0 \
-e ALLOWED_HOSTS=[<参考上下文>] \
-e EMAIL_USE_SSL=True \
-e EMAIL_HOST='smtp.163.com' \
-e EMAIL_PORT=21 \
-e EMAIL_HOST_USER='xxxx@163.com' \
-e EMAIL_HOST_PASSWORD='xxxxx' \
anthonymsen/mmt
```

#### 常规部署方式

- 克隆代码

```shell
git clone https://gitee.com/AnthonyMSen/MMT.git
```

- 配置参数

编辑`MeidaManageTool/settings.py `，在结尾处添加

```python
ALLOWED_HOSTS = []  # 参考内容：['xxx.xxx.com', '192.168.5.10']
EMAIL_USE_SSL = True
EMAIL_HOST = 'smtp.163.com'
EMAIL_PORT = 21
EMAIL_HOST_USER = 'xxxx@163.com'
EMAIL_HOST_PASSWORD = 'xxxxxxx'
```

- 初始化数据库

```shell
python3 manage.py migrate # 第一次创建
python3 manage.py makemigrations # 初始化
python3 manage.py migrate # 正式创建
```

- 运行项目

```shell
# ${LOCAL_IP} 为运行机ip地址，可以为'0.0.0.0'
# ${WEB_PORT} 为网页端口,默认8000
python3 -u /MMT/manage.py runserver ${LOCAL_IP}:${WEB_PORT}
```

- 打开网页

`ip:[端口号]`