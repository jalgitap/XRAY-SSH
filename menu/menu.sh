#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

#color code
export NC='\033[0m'
export multi='\E[43;1;39m'
export semua='\E[45;1;39m'
export new='\E[45;1;39m'
export cyan='\033[0;36m'
export or='\033[1;33m'
export yl='\e[32;1m'
export rd='\e[31;1m'
export C='\033[0;36m'
export R='\e[31;1m'
export G="\033[0;32m"
export B='\033[0;34m'
export O='\033[0;33m'
export light='\033[0;37m'
export W='\033[0;97m'
export end='\033[0m'
export all='\E[42;1;39m'

function status(){
#########################
# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

CITY=$( curl -s ipinfo.io/city )

# CHEK STATUS 
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status trojan-go | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel5 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
squid_service=$(/etc/init.d/squid status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wstls=$(systemctl status ws-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsdrop=$(systemctl status ws-nontls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
shd=$(systemctl status sshd | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udp=$(systemctl status rc-local | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsovpn=$(systemctl status ws-ovpn | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron=$(systemctl status cron | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
sqd=$(systemctl status squid | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
osslh=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udpsts=$(systemctl status udp-custom | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# COLOR VALIDATION
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
green='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
c='\033[0;36m'
LIGHT='\033[0;37m'
clear

# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN}ON ( Running )${NC}"
else
   status_ssh="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE  VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat="${GREEN}ON ( Running )${NC}"
else
   status_vnstat="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GREEN}ON ( Running )${NC}"
else
   status_fail2ban="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   v2ray_tls="${GREEN}ON ( Running )${NC}"
else
   v2ray_tls="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   v2ray_ntls="${GREEN}ON ( Running )${NC}"
else
   v2ray_ntls="${RED}OFF ( Error )${NC}"
fi

# Status Service Trojan GO
if [[ $strgo == "active" ]]; then
  status_trg="${GREEN}ON ( Running )${NC}"
else
  status_trg="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE L2TP
if [[ $trojan_server == "running" ]]; then 
   status_trgo="${GREEN}ON ( Running )${NC}"
else
   status_trgo="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GREEN}ON ( Running )${NC}"
else
   status_beruangjatuh="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel="${GREEN}ON ( Running )${NC}"
else
   status_stunnel="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET TLS
if [[ $wstls == "running" ]]; then 
   swstls="${GREEN}ON ( Running )${NC}"
else
   swstls="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET DROPBEAR
if [[ $wsdrop == "running" ]]; then 
   swsdrop="${GREEN}ON ( Running )${NC}"
else
   swsdrop="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET OPEN OVPN
if [[ $wsovpn == "running" ]]; then 
   swsovpn="${GREEN}ON ( Running )${NC}"
else
   swsovpn="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE SSLH / SSH
if [[ $osslh == "running" ]]; then 
   sosslh="${GREEN}ON ( Running )${NC}"
else
   sosslh="${RED}OFF ( Error )${NC}"
fi

# STATUS OHP DROPBEAR
if [[ $ohp == "running" ]]; then 
   sohp="${GREEN}ON ( Running )${NC}"
else
   sohp="${RED}OFF ( Error )${NC}"
fi

# STATUS OHP OpenVPN
if [[ $ohq == "running" ]]; then 
   sohq="${GREEN}ON ( Running )${NC}"
else
   sohq="${RED}OFF ( Error )${NC}"
fi

# STATUS OHP SSH
if [[ $ohr == "running" ]]; then 
   sohr="${GREEN}ON ( Running )${NC}"
else
   sohr="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET OPENSSH
if [[ $wsopen == "running" ]]; then 
   swsopen="${GREEN}ON ( Running )${NC}" 
else
   swsopen="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE SSHD
if [[ $shd == "running" ]]; then 
   shdd="${GREEN}ON ( Running )${NC}" 
else
   shdd="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE BADVPN
if [[ $udp == "running" ]]; then 
   udpw="${GREEN}ON ( Running )${NC}" 
else
   udpw="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE CRON
if [[ $cron == "running" ]]; then 
   cr="${GREEN}ON ( Running )${NC}" 
else
   cr="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE SQUID
if [[ $sqd == "running" ]]; then 
   sq="${GREEN}ON ( Running )${NC}" 
else
   sq="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE NGINX
if [[ $nginx == "running" ]]; then 
   nx="${GREEN}ON ( Running )${NC}" 
else
   nx="${RED}OFF ( Error )${NC}"
fi
clear

# STATUS UDP CUSTOM
if [[ ${udpsts} == "running" ]]; then
   udp="${GREEN}ON ( Running )${NC}"
else
   udp="${RED}OFF ( Error )${NC}"
fi

echo -e ""
clear
loadcpu=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
up="$(uptime -p | cut -d " " -f 2-10)"
cpu=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
core=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
ct=$(curl -s ipinfo.io/city )
sp=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
IPVPS=$(curl -s ipinfo.io/ip )
DOMAIN=$(cat /etc/xray/domain)
echo -e ""
echo -e " ${ORANGE}DOMAIN      = $DOMAIN"
echo -e " IP          = $IPVPS"
echo -e " ISP         = $sp"
echo -e " CITY        = $ct"
echo -e " LOAD CPU    = $loadcpu %"
echo -e " OS NAME     = "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e " CORE        = $core"
echo -e " UPTIME      = $up"
echo -e " CPU MODEL   =$cpu"
echo -e " RAM         = $tram MB / $uram MB"
echo -e " STORAGE     = $(df -h / | awk '{print $2}' | tail -n1 | sed 's/G//g' | sed 's/ //g') GB" " / Usage $(df -h / | awk '{print $3}' | tail -n1 | sed 's/G//g' | sed 's/ //g') GB${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${multi}                ${rd}Status All Service                  ${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${green}•${NC} NGINX                        = $nx"
echo -e " ${green}•${NC} SSH / TUN                    = $status_ssh"
echo -e " ${green}•${NC} OVPN WS                      = $swsovpn"
echo -e " ${green}•${NC} DROPBEAR                     = $status_beruangjatuh"
echo -e " ${green}•${NC} VNSTAT                       = $status_vnstat"
echo -e " ${green}•${NC} SSH WS TLS                   = $swstls"
echo -e " ${green}•${NC} SSH WS NONE TLS              = $swsdrop"
echo -e " ${green}•${NC} VMESS TLS                    = $v2ray_tls"
echo -e " ${green}•${NC} VMESS NONE TLS               = $v2ray_ntls"
echo -e " ${green}•${NC} TROJAN GO TLS                = $status_trgo"
echo -e " ${green}•${NC} STUNNEL                      = $status_stunnel"
echo -e " ${green}•${NC} SSLH                         = $sosslh"
echo -e " ${green}•${NC} FAIL2BAN                     = $status_fail2ban"
echo -e " ${green}•${NC} SSHD                         = $shdd"
echo -e " ${green}•${NC} BADVPN UDPGW                 = $udpw"
echo -e " ${green}•${NC} CRONTAB                      = $cr"
echo -e " ${green}•${NC} SQUID PROXY                  = $sq"
echo -e " ${green}•${NC} SSH UDP                      = ${udp}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function update(){
clear
echo -e "------------------------------------------------------" | lolcat
echo -e "  ${W}Please wait processing update autoscript xray-ssh${NC}"
echo -e "------------------------------------------------------" | lolcat
sleep 1
wget -q -O /usr/bin/autobckpbot "--no-check-certificate https://sc1.asle.me/backup/bckp.sh" && chmod +x /usr/bin/autobckpbot
wget -q -O /usr/bin/cf-pointing "--no-check-certificate https://sc1.asle.me/menu/cloudflare-pointing.sh" && chmod +x /usr/bin/cf-pointing
wget -q -O /usr/bin/aubckp "--no-check-certificate https://sc1.asle.me/backup/autobckp.sh" && chmod +x /usr/bin/aubckp
wget -q -O /usr/bin/cf-setting "--no-check-certificate https://sc1.asle.me/menu/cloudflare-setting.sh" && chmod +x /usr/bin/cf-setting
wget -q -O /usr/bin/menu "--no-check-certificate https://sc1.asle.me/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/menu-ssh "--no-check-certificate https://sc1.asle.me/menu/function-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -q -O /usr/bin/menu-vmess "--no-check-certificate https://sc1.asle.me/menu/function-vmess.sh" && chmod +x /usr/bin/menu-vmess
wget -q -O /usr/bin/menu-trgo "--no-check-certificate https://sc1.asle.me/menu/function-trgo.sh" && chmod +x /usr/bin/menu-trgo
wget -q -O /usr/bin/license "--no-check-certificate https://sc1.asle.me/menu/license.sh" && chmod +x /usr/bin/license
wget -q -O /usr/bin/backup "--no-check-certificate https://sc1.asle.me/backup/gdrive.sh" && chmod +x /usr/bin/backup
wget -q -O /usr/bin/bkp "--no-check-certificate https://sc1.asle.me/backup/autobackup.sh" && chmod +x /usr/bin/bkp
wget -q -O /usr/bin/info "--no-check-certificate https://sc1.asle.me/ssh/info.sh" && chmod +x /usr/bin/info
wget -q -O /usr/bin/exp "--no-check-certificate https://sc1.asle.me/ssh/autoremove.sh" && chmod +x /usr/bin/exp
wget -q -O /usr/bin/wbmn "--no-check-certificate https://sc1.asle.me/ssh/webmin.sh" && chmod +x /usr/bin/wbmn
wget -q -O /usr/bin/limit "--no-check-certificate https://sc1.asle.me/menu/limit.sh" && chmod +x /usr/bin/limit
wget -q -O /usr/bin/monitorbw "--no-check-certificate https://sc1.asle.me/menu/monitoring.sh" && chmod +x /usr/bin/monitorbw
wget -q -O /usr/bin/autov1 "--no-check-certificate https://sc1.asle.me/backup/autobckp_v1.sh" && chmod +x /usr/bin/autov1
wget -q -O /usr/bin/autov2 "--no-check-certificate https://sc1.asle.me/backup/autobckp_v2.sh" && chmod +x /usr/bin/autov2
sleep 2
echo -e "${or}Update AutoScript XRAY-SSH Succesfuly${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function about(){
clear
echo -e " Saya Berkarya Sesuai Kemampuan Saya Sendiri :)"
echo -e " Maafkan Saya Jika Saya Salah Dalam Menulis Kata²"
echo -e "================================================="
echo -e "#        AutoScript Installer XRAY-SSH          #"
echo -e "================================================="
echo -e "# For Debian 10 64 bit                          #"
echo -e "# For Ubuntu 18.04 & Ubuntu 20.04 64 bit        #"
echo -e "# For VPS with KVM and VMWare virtualization    #"
echo -e "# Modded And Update By Sikecil_Waan :D          #"
echo -e "================================================="
echo -e "# Thanks To                                     #"
echo -e "================================================="
echo -e "# Allah SWT                                     #"
echo -e "# My Family                                     #"
echo -e "# Horasss                                       #"
echo -e "================================================="
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function changesub(){
clear
MYIP=$(wget -qO- ipinfo.io/ip);
clear
read -rp "Input New Domain : " -e domain
echo "$domain" > /var/lib/fsidvpn/ipvps.conf
rm -rf /etc/xray/domain
echo "$domain" >/etc/xray/domain
echo -e "[ ${yl}INFO${NC} ] Start " 
sleep 0.5
systemctl stop ws-nontls
systemctl stop nginx
domain=$(cat /var/lib/fsidvpn/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${rd}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${yl}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${yl}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --force --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${yl}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${yl}INFO${NC} ] Starting service $Cek " 
sleep 2
echo "$domain" >/etc/xray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "[ ${yl}INFO${NC} ] All finished... " 
sleep 0.5
clear
echo -e ""
echo -e "Starting Restart All Service"
sleep 2
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart xray
systemctl restart ws-ovpn
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/sslh restart
/etc/init.d/stunnel5 restart
/etc/init.d/openvpn restart
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
echo -e "Restart All Service Berhasil"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function certscript(){
clear
echo -e "${rd}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$nc"
echo -e "${yl}               • RENEW DOMAIN SSL •               $nc"
echo -e "${rd}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$nc"
echo -e ""
echo -e "[ ${yl}INFO${NC} ] Start " 
sleep 0.5
systemctl stop ws-nontls
systemctl stop nginx
domain=$(cat /var/lib/fsidvpn/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${rd}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${yl}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${yl}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --force --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${yl}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${yl}INFO${NC} ] Starting service $Cek " 
sleep 2
echo "$domain" > /etc/xray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "[ ${yl}INFO${NC} ] All finished... " 
sleep 0.5
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function restart(){
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33m\033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 8; i++)); do
            echo -ne "\033[0;32m🟣"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33m\033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    systemctl daemon-reload
}
res2() {
    systemctl restart nginx.service
}
res3() {
    systemctl restart xray.service
}
res4() {
    systemctl restart rc-local.service
}
res5() {
    systemctl restart dropbear.service
}
res6() {
    systemctl restart stunnel5.service
}
res7() {
    systemctl restart sshd.service
}
res8() {
    systemctl restart sslh.service
}
res9() {
    systemctl restart openvpn.service
}
res10() {
    systemctl restart cron.service
}
res11() {
    systemctl restart trojan-go.service
}
res12() {
    systemctl restart ws-tls.service
}
res13() {
    systemctl restart ws-nontls.service
}
res14() {
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
}

res15() {
systemctl restart udp-custom.service
}

res16() {
systemctl restart fail2ban.service
}

res17() {
systemctl restart squid.service
}


clear
echo -e "\e[31;1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "\E[47;1;39m       RESTART SERVICE YOU SERVER         \e[0m"
  echo -e "\e[31;1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "  \033[1;33m Service Daemon-Reload\033[1;37m"
fun_bar 'res1'
echo -e "  \033[1;33m Service Restart Nginx\033[1;37m"
fun_bar 'res2'
echo -e "  \033[1;33m Service Restart Xray\033[1;37m"
fun_bar 'res3'
echo -e "  \033[1;33m Service Restart Rc-Local\033[1;37m"
fun_bar 'res4'
echo -e "  \033[1;33m Service Restart Dropbear\033[1;37m"
fun_bar 'res5'
echo -e "  \033[1;33m Service Restart Stunnel5\033[1;37m"
fun_bar 'res6'
echo -e "  \033[1;33m Service Restart Sshd\033[1;37m"
fun_bar 'res7'
echo -e "  \033[1;33m Service Restart Sslh\033[1;37m"
fun_bar 'res8'
echo -e "  \033[1;33m Service Restart OpenVpn\033[1;37m"
fun_bar 'res9'
echo -e "  \033[1;33m Service Restart Cron\033[1;37m"
fun_bar 'res10'
echo -e "  \033[1;33m Service Restart Trojan-Go\033[1;37m"
fun_bar 'res11'
echo -e "  \033[1;33m Service Restart Ws-TLS\033[1;37m"
fun_bar 'res12'
echo -e "  \033[1;33m Service Restart Ws-NonTLS\033[1;37m"
fun_bar 'res13'
echo -e "  \033[1;33m Service Restart Ssh-UDP\033[1;37m"
fun_bar 'res14'
echo -e "  \033[1;33m Service Restart Fail2ban\033[1;37m"
fun_bar 'res15'
echo -e "  \033[1;33m Service Restart Squid-Proxy\033[1;37m"
fun_bar 'res16'
  echo -e "\e[31;1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Tap ( Enter ) to back menu.!!"
menu
}

function xol(){
clear
apt update && apt upgrade
apt install python3 python3-pip git
#git clone https://github.com/jalgitap/XRAY-SSH.git
#unzip XRAY-SSH/xolpanel.zip
wget https://raw.githubusercontent.com/jalgitap/XRAY-SSH/main/xolpanel.zip
unzip XRAY-SSH/xolpanel.zip
pip3 install -r xolpanel/requirements.txt

#isi data
echo ""
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram : " admin
domain=$(cat /etc/xray/domain)
echo -e BOT_TOKEN='"'$bottoken'"' > /root/xolpanel/var.txt
echo -e ADMIN='"'$admin'"' >> /root/xolpanel/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/xolpanel/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "DOMAIN         : $bottoken"
echo "Email          : $admin"
echo "Api Key        : $domain"
echo -e "==============================="
echo "Setting done"

cat > /etc/systemd/system/xolpanel.service << END
[Unit]
Description=@XolPanel - Mod By @WaanSuka_Turu
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m xolpanel
Restart=always

[Install]
WantedBy=multi-user.target
END

rm -rf XRAY-SSH
cd
clear
#Create Sh
cp /root/xolpanel/ssh/unlock.sh /usr/bin/unlockssh ; chmod +x /usr/bin/unlockssh
cp /root/xolpanel/ssh/lock.sh /usr/bin/lockssh ; chmod +x /usr/bin/lockssh
cp /root/xolpanel/ssh/addssh.sh /usr/bin/addssh ; chmod +x /usr/bin/addssh
cp /root/xolpanel/ssh/cekssh.sh /usr/bin/cekssh ; chmod +x /usr/bin/cekssh
cp /root/xolpanel/ssh/delssh.sh /usr/bin/delssh ; chmod +x /usr/bin/delssh
cp /root/xolpanel/ssh/list.sh /usr/bin/listssh ; chmod +x /usr/bin/listssh
cp /root/xolpanel/ssh/renewssh.sh /usr/bin/renewssh ; chmod +x /usr/bin/renewssh
cp /root/xolpanel/ssh/restartmanual.sh /usr/bin/restartmanual ; chmod +x /usr/bin/restartmanual

#Create Vmess
cp /root/xolpanel/vmess/addws.sh /usr/bin/addws ; chmod +x /usr/bin/addws
cp /root/xolpanel/vmess/delws.sh /usr/bin/delws ; chmod +x /usr/bin/delws
cp /root/xolpanel/vmess/trialws.sh /usr/bin/trialws ; chmod +x /usr/bin/trialws
cp /root/xolpanel/vmess/list.sh /usr/bin/listws ; chmod +x /usr/bin/listws
cp /root/xolpanel/vmess/renewws.sh /usr/bin/renewws ; chmod +x /usr/bin/renewws

#Create Trojan
cp /root/xolpanel/trojan/addtr.sh /usr/bin/addtr ; chmod +x /usr/bin/addtr
cp /root/xolpanel/trojan/deltr.sh /usr/bin/deltr ; chmod +x /usr/bin/deltr
cp /root/xolpanel/trojan/renewtr.sh /usr/bin/renewtr ; chmod +x /usr/bin/renewtr
cp /root/xolpanel/trojan/list.sh /usr/bin/listtr ; chmod +x /usr/bin/listtr

#Create Vless
cp /root/xolpanel/vless/addvless.sh /usr/bin/add-vless ; chmod +x /usr/bin/add-vless
cp /root/xolpanel/vless/deletevless.sh /usr/bin/delete-vless ; chmod +x /usr/bin/delete-vless
cp /root/xolpanel/vless/member.sh /usr/bin/list-vless ; chmod +x /usr/bin/list-vless
cp /root/xolpanel/vless/renewvless.sh /usr/bin/renew-vless ; chmod +x /usr/bin/renew-vless
cp /root/xolpanel/vless/trialvless.sh /usr/bin/trial-vless ; chmod +x /usr/bin/trial-vless

#other menu
cp /root/xolpanel/trojan/backup.sh /usr/bin/backupbot ; chmod +x /usr/bin/backupbot
cp /root/xolpanel/trojan/restore.sh /usr/bin/restorebot ; chmod +x /usr/bin/restorebot
cp /root/xolpanel/trojan/syssinfo.sh /usr/bin/systeminfo ; chmod +x /usr/bin/systeminfo
cp /root/xolpanel/trojan/infoaja.sh /usr/bin/infobot ; chmod +x /usr/bin/infobot
cp /root/xolpanel/trojan/infoservice.sh /usr/bin/infoservice ; chmod +x /usr/bin/infoservice
cp /root/xolpanel/trojan/list-accounts.sh /usr/bin/list-accounts ; chmod +x /usr/bin/list-accounts
cp /root/xolpanel/trojan/bandwidth-usage.sh /usr/bin/bandwidth-usage ; chmod +x /usr/bin/bandwidth-usage
systemctl start xolpanel 
systemctl enable x xolpanel
systemctl daemon-reload
systemctl restart xolpanel
clear
echo " Installations complete, type /menu on your bot"
}

clear
day=$(date "+%A")
jam=$(date "+%T")
script_info=$(curl -sS https://raw.githubusercontent.com/jalgitap/izin/main/notice)
totalram=$(free -m | awk 'NR==2 {print $2}')
usageram=$(free -m | awk 'NR==2 {print $3}')
ip=$(curl -sS ipv4.icanhazip.com)
expscript=$(curl -sS https://izin.weleri.id/ipuser | grep $ip | awk '{print $3}')
d2=$(date -d "$biji" +"+%s")
d1=$(date -d "$expscript" +"+%s")
dayleft=$(( ($d1 - $d2) / 86400 ))
client=$(curl -sS https://izin.weleri.id/ipuser | grep $ip | awk '{print $2}')
datainfo=$(date)
upusage="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
tousage="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
downusage="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
trojanws=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | column -t | sort | uniq | wc -l)
sshws=$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)
vmess=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | wc -l)
vless=$(grep -E "^#&&# " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | wc -l)
echo -e "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e " ${C}│${NC}         ${yl}Hi, Wellcome To AutoScript SSH & Xray Only${NC}         ${C}│${NC}
 ${C}│${NC}            ${yl}Thanks You For Using This AutoScript${NC}            ${C}│${NC}
 ${C}│${NC}                  ${rd}Script credit by @Horass${NC}                  ${C}│${NC}"
echo -e "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "   ${O}Tanggal :${NC} ${light}${biji}${NC}   ${O}Waktu :${NC} ${light}${jam}${NC}   ${O}Hari :${NC} ${light}${day}${NC}
  ${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
                 ${C}┌───────────────────────────┐${NC}
                 ${C}│${NC}${new} ☟☟ FOR MENU AUTOSCRIPT ☟☟ ${end}${C}│${NC}
                 ${C}└───────────────────────────┘${NC}
  ${C}┌───────────────────────────────────────────────────────────┐${NC}
  ${C}│${NC}     ${rd}1.)${NC} ${O}MENU SSH-WS${NC}           ${rd}10.)${NC} ${O}REGISTER IP CLIENT${NC}     ${C}│${NC}
  ${C}│${NC}     ${rd}2.)${NC} ${O}MENU VMESS-WS${NC}         ${rd}11.)${NC} ${O}ABOUT SCRIPT${NC}           ${C}│${NC}
  ${C}│${NC}     ${rd}3.)${NC} ${O}MENU TROJAN-WS${NC}        ${rd}12.)${NC} ${O}RESTART SERVICE${NC}        ${C}│${NC}
  ${C}│${NC}     ${rd}4.)${NC} ${O}BACKUP/RESTORE${NC}        ${rd}13.)${NC} ${O}REBOOT SERVER${NC}          ${C}│${NC}
  ${C}│${NC}     ${rd}5.)${NC} ${O}RUNNING SERVICE${NC}       ${rd}14.)${NC} ${O}INSTALL WEBMIN${NC}         ${C}│${NC}
  ${C}│${NC}     ${rd}6.)${NC} ${O}CHANGE DOMAIN${NC}         ${rd}15.)${NC} ${O}POINTING DNS${NC}           ${C}│${NC}
  ${C}│${NC}     ${rd}7.)${NC} ${O}UPDATE SCRIPT${NC}         ${rd}16.)${NC} ${O}PORT INFO${NC}              ${C}│${NC}
  ${C}│${NC}     ${rd}8.)${NC} ${O}RENEW CERT SSL${NC}        ${rd}17.)${NC} ${O}SIMPLE BOT${NC}             ${C}│${NC}
  ${C}│${NC}     ${rd}9.)${NC} ${O}BANDWIDTH USAGE${NC}       ${rd}18.)${NC} ${O}LIMIT SPEED${NC}            ${C}│${NC}
  ${C}└───────────────────────────────────────────────────────────┘${NC}
  ${C}┌─────────────────────────────────────┐${NC}
  ${C}│${NC}   ${O}• Client Script Info •${NC}
  ${C}│${NC}   ${yl}Client Name  :${NC} $client
  ${C}│${NC}   ${yl}Expired Tggl :${NC} $expscript
  ${C}│${NC}   ${yl}Sisa Aktif   :${NC} $dayleft Days
  ${C}│${NC}
  ${C}│${NC}   ${O}• Accounts Info •${NC}
  ${C}│${NC}   ${yl}SSH-WS      :${NC} $sshws
  ${C}│${NC}   ${yl}VLESS-WS    :${NC} $vless
  ${C}│${NC}   ${yl}TROJAN-WS   :${NC} $trojanws
  ${C}│${NC}   ${yl}VMESS-WS    :${NC} $vmess
  ${C}└─────────────────────────────────────┘${NC}"
echo -e "
   ${light}${script_info}${NC}
"
read -p " Select Options Number ($( echo -e "${O}1-18${NC})") : " opt
echo -e ""
if [ -z $opt ]; then
echo -e "${rd}Options Number Not Selected.!!${NC}"
echo ""
fi
case $opt in
1) clear ; menu-ssh;;
2) clear ; menu-vmess;;
3) clear ; menu-trgo;;
4) clear ; backup;;
5) clear ; status;;
6) clear ; changesub;;
7) clear ; update;;
8) clear ; certscript;;
9) clear ; monitorbw;;
10) clear ; license;;
11) clear ; about;;
12) clear ; restart;;
13) clear : reboot;;
14) clear ; wbmn;;
15) clear ; cf-pointing;;
16) clear ; info;;
17) clear ; xol;;
18) clear ; limit;;
esac
