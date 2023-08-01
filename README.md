# Nextcloud_freeport
This repository contains nextcloud for free ports in docker-compose.
If you can't or don't want to open 80, 443 port, this repository may be useful.
This repository supports only docker for Linux.

## Usage
This repository uses MyDNS and Let's Encrypt.
1. Sign up MyDNS and get your domain.
2. Get a certificate for your domain from Let's Encrypt by this code. (Replace \<xxx\>)
If you haven't installed certbot, install it from apt or snap.
```
certbot certonly --manual --keep\
        --preferred-challenges=dns \
        --manual-auth-hook /DirectEdit/DirectEdit-master/txtregist.php \
        --manual-cleanup-hook /DirectEdit/DirectEdit-master/txtdelete.php \
        -d <your domain> -d *.<your domain> \
        --server https://acme-v02.api.letsencrypt.org/directory \
        --agree-tos -m <your mail address> \
        --manual-public-ip-logging-ok
```
3. Modify setting files. You need write your mail address, domain, MyDNS ID, MyDNS password, data directory, and HTTP/HTTPS ports you want to open.
Replace \<xxx\> in
./.env
./mydns_letsencrypt/mydns/txtedit.conf
./mydns_letsencrypt/mydns/mydns.env
4. Start Nextcloud to run this code in ./.
```
sudo docker-compose up -d
```
5. Access https://\<your domain\>:\<HTTPS port\>

DNS notification and certificate refresh is conducted automatically.
