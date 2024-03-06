FROM debian:bullseye

RUN	apt update
RUN	apt upgrade
RUN	apt install nginx openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=auvergne-rhone-alpes/L=lyon/O=42/OU=cllovio/CN=cllovio.42.fr/UID=cllovio"

EXPOSE 443

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD		["nginx", "-g", "daemon off;"]