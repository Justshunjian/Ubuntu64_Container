FROM registry.cn-hangzhou.aliyuncs.com/ubuntu64_kaylv/ubuntu64:v0.08

LABEL MAINTAINER "kaylv" "kaylv@dayuw.com"

RUN apt update \
	&& apt install -y supervisor \
	&& apt install -y curl \
	&& chmod -R 755 /var/run/php-fpm

# copy configure files
ADD src /var/www/kaylv

# cd 
WORKDIR /var/www/kaylv

STOPSIGNAL SIGTERM

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor.conf"]
