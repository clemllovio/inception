FROM		debian:bullseye

RUN		apt-get update 
RUN		apt-get install nginx	-y
RUN		apt-get install openssl	-y
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
	    -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt \
	    -subj "/C=FR/L=Lyon/O=42/OU=cllovio/CN=cllovio.42.fr"

COPY	./conf/nginx.conf /etc/nginx/sites-enabled/default

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]