FROM debian:stable
WORKDIR /DirectEdit/

RUN apt-get -y update && \
    apt-get -y install busybox-static wget unzip certbot php php7.4-mbstring && \
    apt-get -y autoremove && apt-get -y clean
RUN wget 'https://github.com/disco-v8/DirectEdit/archive/master.zip' -O DirectEdit-master.zip && unzip ./DirectEdit-master.zip

WORKDIR /DirectEdit/DirectEdit-master
RUN chmod 700 ./*.php && chmod 600 ./*.conf
COPY txtedit.conf .
COPY start.sh /

CMD ["/start.sh"]
