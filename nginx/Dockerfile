FROM alpine:3.8

MAINTAINER Cedric ANTHONY <cedric@antho.dev>

RUN apk add --update --no-cache nginx

COPY nginx.conf /etc/nginx/
COPY app.conf /etc/nginx/conf.d/

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

# RUN adduser -D -g '' -G www-data www-data
RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
