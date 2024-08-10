FROM debian:latest

RUN apt-get update && apt-get install -y php-fpm php-mysqli curl
RUN apt install mariadb-client -y

COPY www.conf /etc/php/8.2/fpm/pool.d/.
COPY script.sh .
RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]
CMD ["php-fpm8.2", "-F"]