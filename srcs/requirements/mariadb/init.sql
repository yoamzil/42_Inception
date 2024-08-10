#!/bin/bash

    mysqld --bootstrap << EOF
            FLUSH PRIVILEGES;

            ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
            CREATE DATABASE IF NOT EXISTS wordpress;
            CREATE USER 'wpuser'@'%' IDENTIFIED by 'password';
            GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%';
        
            FLUSH PRIVILEGES;
EOF

exec $@