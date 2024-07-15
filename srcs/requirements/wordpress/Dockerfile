# Use the penultimate stable version of Alpine as the base image
FROM alpine:3.17

# Install PHP, PHP-FPM, and WordPress dependencies
RUN apk update && apk add --no-cache php php-fpm php-mysqli php-json php-session curl

# Download and install WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    mv wordpress /var/www/wordpress && \
    rm latest.tar.gz

# Copy PHP-FPM configuration file
COPY ./conf/php-fpm.conf /etc/php7/php-fpm.d/

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the working directory
WORKDIR /var/www/wordpress

# Start PHP-FPM
CMD ["php-fpm7", "-F"]
