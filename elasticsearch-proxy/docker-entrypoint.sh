#!/bin/bash


if [ -z "$ELASTIC_PROXY_CREDS" ]
then
cat > /etc/nginx/conf.d/elastic.conf <<- EOM
server {
    listen 9200;
    server_name elasticsearch _;

    chunked_transfer_encoding on;
    client_max_body_size 0;

    location / {
        proxy_read_timeout  900;
        proxy_pass ${ELASTIC_PROXY_URL};
    }
}
EOM
else
# We need encode the headers
CREDS=`echo -n ${ELASTIC_PROXY_CREDS} | base64`

cat > /etc/nginx/conf.d/elastic.conf <<- EOM
server {
    listen 9200;
    server_name elasticsearch _;

    chunked_transfer_encoding on;
    client_max_body_size 0;

    location / {
        proxy_read_timeout  900;
        proxy_pass ${ELASTIC_PROXY_URL};
        proxy_set_header    Authorization "Basic ${CREDS}";
    }
}
EOM
fi


nginx -g 'daemon off;'