FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx 
RUN apt-get install -y openssl 

COPY ./conf/default /etc/nginx/sites-available/.
COPY ./tools/gen_certs.sh .

RUN chmod +x gen_certs.sh
RUN chmod 777 /etc/nginx/sites-available/default

ENTRYPOINT [ "./gen_certs.sh" ]
CMD ["nginx", "-g", "daemon off;"]