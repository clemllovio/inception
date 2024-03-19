FROM debian:bullseye

RUN	apt update && apt upgrade

RUN apt-get install wget curl -y
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN apt-get install php7.4 php-fpm php-mysqli mariadb-client -y

COPY		./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY		./conf/auto_install.sh .

RUN		chmod +x auto_install.sh
ENTRYPOINT	["./auto_install.sh"]

CMD		["/usr/sbin/php-fpm7.4", "--nodaemonize"]
