FROM registry.cn-hangzhou.aliyuncs.com/ubuntu64_kaylv/ubuntu64:v0.07

LABEL MAINTAINER "kaylv" "kaylv@dayuw.com"

RUN apt update \
	&& apt install -y supervisor \
	&& apt install -y curl \
	&& chmod -R 755 /var/run/php-fpm

# copy configure files
ADD src /var/www/kaylv

# supervisor
ADD config/supervisor.conf /etc/supervisor.conf
ADD config/supervisor.fpm.conf /etc/supervisor.d/fpm.conf
ADD config/supervisor.nginx.conf /etc/supervisor.d/nginx.conf

# nginx
ADD config/nginx.default.conf /usr/local/nginx/nginx.conf

# cd 
WORKDIR /var/www/kaylv

STOPSIGNAL SIGTERM

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor.conf"]
