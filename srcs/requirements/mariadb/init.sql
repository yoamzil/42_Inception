#!/bin/bash

    mysqld --bootstrap << EOF
            FLUSH PRIVILEGES;

            ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
            CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
            CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED by '${MYSQL_PASSWORD}';
            GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%';
        
            FLUSH PRIVILEGES;
EOF

exec $@