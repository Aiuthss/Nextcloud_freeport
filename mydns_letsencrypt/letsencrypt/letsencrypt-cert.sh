source $(cd $(dirname $0); pwd)/../../.env

docker build -t certbot $(cd $(dirname $0); pwd)
docker run -it --rm \
	--name certbot \
	-v /etc/letsencrypt:/etc/letsencrypt \
	-v /var/lib/letsencrypt:/var/lib/letsencrypt \
	certbot \
	certbot certonly --manual --keep\
        --preferred-challenges=dns \
        --manual-auth-hook /DirectEdit/DirectEdit-master/txtregist.php \
        --manual-cleanup-hook /DirectEdit/DirectEdit-master/txtdelete.php \
        -d ${DOMAIN} -d *.${DOMAIN} \
        --server https://acme-v02.api.letsencrypt.org/directory \
        --agree-tos -m ${MAILADDR} \
        --manual-public-ip-logging-ok
        
cp /etc/letsencrypt/live/${DOMAIN}/cert.pem /etc/letsencrypt/live/${DOMAIN}/${CERT_NAME}.crt
cp /etc/letsencrypt/live/${DOMAIN}/privkey.pem /etc/letsencrypt/live/${DOMAIN}/${CERT_NAME}.key
