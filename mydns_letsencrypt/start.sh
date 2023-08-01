cp /etc/letsencrypt/live/${DOMAIN}/cert.pem /etc/nginx/certs/${CERT_NAME}.crt
cp /etc/letsencrypt/live/${DOMAIN}/privkey.pem /etc/nginx/certs/${CERT_NAME}.key
busybox crond -f
