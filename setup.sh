#!/bin/sh

envsubst < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf

for filename in /etc/nginx/conf.d/*.conf; do
    envsubst < $filename > $filename
done

for filename in /etc/nginx/sites-available/*.conf; do
    envsubst < $filename > $filename
done