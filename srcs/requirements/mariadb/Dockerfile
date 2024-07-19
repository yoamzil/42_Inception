FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server

# Create /run/mysqld for the MariaDB socket and set permissions
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql

CMD ["mysqld"]