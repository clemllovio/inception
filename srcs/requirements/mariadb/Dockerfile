FROM debian:bullseye

RUN	apt update && apt upgrade
RUN	apt install mariadb-server -y

EXPOSE 3306

CMD ["mariadb"]

# faire le .env
# commment dna sodckercompose j'envoie .env dans docker et comment j'envoie le .env dans dockerfile