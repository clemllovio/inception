FROM debian:bullseye

RUN	apt update && apt upgrade

RUN apt-get install wget -y
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN apt-get install php7.3 php-fpm php-mysqli mariadb-client -y

ENTRYPOINT ["/conf/wp-config.sh"]
