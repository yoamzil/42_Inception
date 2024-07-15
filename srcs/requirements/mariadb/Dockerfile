# Use the penultimate stable version of Alpine as the base image
FROM alpine:3.17

# Install MariaDB
RUN apk update && apk add --no-cache mariadb mariadb-client

# Copy the custom MariaDB configuration file
COPY ./conf/my.cnf /etc/my.cnf

# Create necessary directories and set permissions
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Expose port 3306 for MariaDB
EXPOSE 3306

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpress_user
ENV MYSQL_PASSWORD=wordpress_password

# Initialize MariaDB data directory
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Copy the database initialization script
COPY ./conf/init_db.sh /docker-entrypoint-initdb.d/

# Start MariaDB
CMD ["mysqld"]
