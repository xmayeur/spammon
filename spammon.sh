#!/bin/sh

# wget  https://raw.githubusercontent.com/xmayeur/spammon/master/SpamMon.conf

docker rm -f spammon
docker pull xmayeur/spammon
docker run --name spammon --restart always -v /root/:/conf/ -v /var/log:/var/log/ xmayeur/spammon &
