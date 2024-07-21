#!/bin/bash
DB_USER='${DB_USER}'
DB_PASS='${DB_PASS}'
DB_NAME='${DB_NAME}'
DB_HOST='${DB_HOST}'

# Update application configuration
echo "DB_USER=${DB_USER}" >> /etc/environment
echo "DB_PASS=${DB_PASS}" >> /etc/environment
echo "DB_NAME=${DB_NAME}" >> /etc/environment
echo "DB_HOST=${DB_HOST}" >> /etc/environment

# Start your web application
sudo systemctl start webapp.service