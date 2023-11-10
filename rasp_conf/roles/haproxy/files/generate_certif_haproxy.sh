#!/bin/bash

domain=$1
aws_key_id=$2
aws_key=$3
export AWS_ACCESS_KEY_ID=$aws_key_id
export AWS_SECRET_ACCESS_KEY=$aws_key
certbot certonly --dns-route53 --keep-until-expiring --non-interactive --agree-tos -d "$domain" 
mkdir -p /etc/haproxy/certs
cat /etc/letsencrypt/live/"$domain"/fullchain.pem /etc/letsencrypt/live/"$domain"/privkey.pem > /etc/haproxy/certs/"$domain".pem
