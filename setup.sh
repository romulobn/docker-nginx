#!/bin/sh

export DOCKERHOST=$(ip route|awk '/default/ { print $3 }')

echo $DOCKERHOST

envsubst < /etc/nginx/conf.d/upstream.conf > /etc/nginx/conf.d/upstream.conf

envsubst < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf
