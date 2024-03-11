FROM debian:bullseye

EXPOSE 443

RUN	apt update 
RUN	apt upgrade 
RUN	apt install nginx -y
RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=auvergne-rhone-alpes/L=lyon/O=42/OU=cllovio/CN=cllovio.42.fr/UID=cllovio"

# RUN rm /etc/nginx/sites-enabled/default
COPY conf/nginx.conf /etc/nginx/nginx.conf
# RUN ln -s /etc/nginx/nginx/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# RUN echo "include /etc/nginx/sites-available/nginx.conf;" > /etc/nginx/sites-available/nginx.conf
RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT	["nginx", "-g", "daemon off;"]
