source $(cd $(dirname $0); pwd)/mydns.env
wget -O - http://${MYDNSID}:${MYDNSPW}@www.mydns.jp/login.html
