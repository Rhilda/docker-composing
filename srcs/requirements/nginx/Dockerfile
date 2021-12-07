FROM alpine:3.13

ENV WP_ROOT="/var/www/wordpress"

RUN apk update \ 
	&& apk add openssl \
	&& apk add nginx
RUN chown -R nginx:nginx /var/www \
	&& chmod 755 /var/www \
	&& chown -R nginx:nginx /etc/nginx \
	&& mkdir /etc/nginx/ssl \
	&& mkdir -p run/nginx/ \
	&& chown -R nginx:nginx run/nginx

RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.crt -keyout /etc/nginx/ssl/localhost.key -subj "/C=RU/ST=Russia/L=Kazan/O=21/OU=Student/CN=127.0.0.1"

COPY nginx.conf ./etc/nginx/conf.d/default.conf
EXPOSE 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]
