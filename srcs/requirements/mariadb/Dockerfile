FROM debian:bullseye

ARG	DB_NAME
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

RUN	apt update && apt upgrade
RUN	apt install mariadb-server -y

RUN service mariadb start && mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
												CREATE  USER IF NOT EXISTS ${MYSQL_USER}@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
												GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
 												ALTER USER 'root'@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; \
 												FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mariadbd", "--bind_address=0.0.0.0"]