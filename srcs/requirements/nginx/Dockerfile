# Use the penultimate stable version of Alpine as the base image
FROM alpine:3.17

# Install NGINX and OpenSSL
RUN apk update && apk add --no-cache nginx openssl

# Remove the default server definition
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom NGINX configuration file
COPY ./conf/nginx.conf /etc/nginx/conf.d/

# Expose port 443 for HTTPS
EXPOSE 443

# Create necessary directories and set permissions
RUN mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx

# Copy TLS certificates
COPY ./conf/certs /etc/nginx/certs

# Set the user to run the container
USER nginx

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
