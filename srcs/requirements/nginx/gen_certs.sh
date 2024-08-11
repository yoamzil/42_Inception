#!/bin/bash

private_key="/etc/ssl/private/nginx-selfsigned.key"
CS_REQUEST="/etc/ssl/certs/nginx-selfsigned.crt"

echo "Generate the private key ... ";
openssl genpkey -algorithm RSA -out "$private_key"

echo "Generate the Certificate Signing Request (CS_REQUEST) ... ";
openssl req -new -key "$private_key" -out "$CS_REQUEST" -subj "/C=MO/L=MD/O=1337/OU=STUDENT/CN=yoamzil.42.fr"

echo "Generate Self-Signed Certificate ... ";
openssl x509 -req -in "$CS_REQUEST" -signkey "$private_key" -out "/etc/ssl/certs/nginx-selfsigned.crt"

echo "Nginx: starting the daemon ...";
nginx -g "daemon off;"