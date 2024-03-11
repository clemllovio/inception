FROM debian:bullseye

RUN	apt update && apt upgrade
RUN	apt install mariadb-server -y

RUN sudo systemctl start mariadb-server && mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME} \
															CREATE  USER IF NOT EXISTS ${MYSQL_USER}@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD} \
															GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${MYSQL_USER} @'%' IDENTIFIED BY ${MYSQL_PASSWORD} \
															ALTER USER 'root'@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'"

EXPOSE 3306

CMD ["mariadb"]

# faire le .env
# commment dna sodckercompose j'envoie .env dans docker et comment j'envoie le .env dans dockerfile