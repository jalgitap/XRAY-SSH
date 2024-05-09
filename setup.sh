#!/bin/bash
clear
########
apt update -y
apt upgrade -y
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget --no-check-certificate https://sc1.asle.me/run.sh && chmod +x run.sh && sed -i -e 's/\r$//' run.sh && screen -S run.sh ./run.sh
rm -rf setup.sh
