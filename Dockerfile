FROM php:8.4-fpm-alpine

ARG BAIKAL_VERSION=0.13.0

RUN apk add --no-cache nginx curl \
    && docker-php-ext-install pdo pdo_mysql \
    && mkdir -p /run/nginx

RUN curl -fsSL "https://github.com/sabre-io/Baikal/releases/download/${BAIKAL_VERSION}/baikal-${BAIKAL_VERSION}.zip" \
      -o /tmp/baikal.zip \
    && unzip /tmp/baikal.zip -d /var/www \
    && rm /tmp/baikal.zip \
    && chown -R www-data:www-data /var/www/baikal

COPY nginx.conf /etc/nginx/http.d/default.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["/entrypoint.sh"]
