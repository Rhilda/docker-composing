FROM alpine:3.13
RUN mkdir -p run/php
RUN apk update \
	&& apk add sudo \
	mariadb-client \
	curl \
	php7 php7-fpm php7-phar php7-mysqli php7-common php7-curl php7-cli php7-json php7-session php7-mbstring
RUN adduser -S nginx && addgroup -S nginx
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	cp wp-cli.phar /usr/bin/wp
WORKDIR /var/www/wordpress
COPY start.sh .
COPY wp-config.php .
COPY www.conf /etc/php7/php-fpm.d/www.conf
RUN  wp core download
RUN chmod +x start.sh
ENTRYPOINT ["./start.sh"]
