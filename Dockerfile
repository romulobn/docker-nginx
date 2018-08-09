
FROM nginx:alpine

COPY nginx.conf /etc/nginx/

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data

COPY ./sites /etc/nginx/sites-available
COPY ./conf.d/upstream.conf /etc/nginx/conf.d/
COPY ./setup.sh /bin/setup

# Set upstream conf and remove the default conf
RUN /bin/setup && rm /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80 443