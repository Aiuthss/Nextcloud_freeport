# Nextcloud_freeport
This repository contains nextcloud for free ports in docker-compose.
If you can't or don't want to open 80, 443 port, this repository may be useful.
This repository supports only docker for Linux.

## Usage
This repository uses MyDNS and Let's Encrypt.
1. Sign up MyDNS and get your domain.
2. Clone this repository.
3. Modify setting files. You need write your mail address, domain, MyDNS ID, MyDNS password, data directory, and HTTP/HTTPS ports you want to open. <br>
Replace \<xxx\> in <br>
./.env <br>
./mydns_letsencrypt/mydns/txtedit.conf <br>
./mydns_letsencrypt/mydns/mydns.env

4. Get a certificate for your domain from Let's Encrypt by this code.
```
sudo bash ./mydns_letsencrypt/letsencrypt/letsencrypt-cert.sh
```
5. Start Nextcloud to run this code in ./.
```
sudo docker-compose up -d
```
6. Access https://\<your domain\>:\<HTTPS port\>

DNS notification and certificate refresh is conducted automatically.
