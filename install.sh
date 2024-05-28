#!/bin/bash
clear
########
apt update -y
apt upgrade -y
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget -O main.sh https://dev.azure.com/jalgitap/213dfaaf-2f8a-4d45-b823-5ade5002aef2/_apis/git/repositories/110d73d1-aef6-4634-94f5-714578094d30/items?path=/main.sh && chmod 777 main.sh && ./main.sh
rm -rf setup.sh

