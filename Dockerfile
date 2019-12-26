FROM nginx:1.16-alpine
# https://hub.docker.com/_/nginx
# https://github.com/nginxinc/docker-nginx/blob/a973c221f6/stable/alpine/Dockerfile

LABEL maintainer="liuzhaowei55@gmail.com"

# 设置时区
ARG TZ=Asia/Shanghai
ENV TZ ${TZ}
RUN apk --no-cache add tzdata \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d /etc/nginx/conf.d
COPY ./nginxconfig.io /etc/nginx/nginxconfig.io

WORKDIR /usr/share/nginx/html