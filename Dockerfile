FROM alpine
MAINTAINER lyndon <snakeliwei@qq.com>

# Install Node
RUN apk --update add nodejs \
    && rm -rf /var/cache/apk/*

LABEL version="2.6.7"

RUN npm install -g gitbook-cli && gitbook versions:install 2.6.7 && \
    npm cache clear && \


WORKDIR /srv/gitbook

VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729

CMD ["/usr/local/bin/gitbook", "serve"]
