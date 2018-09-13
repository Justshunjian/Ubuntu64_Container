Add docker and the docker-composer build file

1.config

configuration files

note:Nginx default access directory in docker is /var/www/kaylv

2.src

Program source code

3.说明

新更新之后，代码和配置直接进行修改，无需重新构建，也无需docker-compose up

windows docker 请使用DockerfileWindows， 执行命令：copy DockerfileWindows Dockerfile

linux docker 请使用DockerfileLinux, 执行命令：cp DockerfileWindows Dockerfile


4.使用

4.1 调整docker中源码存放目录，可修改Dockerfile文件

4.2 调整域名映射和端口，可修改config/nginx.default.conf

4.3 最后，根据以上调整，更新docker-compose.yml

5.启动

5.1 构建

docker-compose build

5.2 启动

docker-compose up

5.3 停止

docker-compose down

6. 访问

此处docker-compose.yml中映射的是8700端口

127.0.0.1:8700 或者 域名:8700

注

如果是单独直接运行docker，可以用一下命令

先查看 ：docker images

执行 ： docker run -p 8700:80 -it [IMAGE ID]
