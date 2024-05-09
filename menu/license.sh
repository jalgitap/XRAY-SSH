#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
green="\033[0;32m"
red="\033[0;31m"
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/jalgitap/izin/main/ipadmin > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/jalgitap/izin/main/ipadmin | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/jalgitap/izin/main/ipadmin | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
O='\033[0;33m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
echo -e ""
echo -e "
You IP ( ${red}${MYIP}${NC} ) blocked, you not admin
"
echo -e ""
exit 0
fi

green='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
#ColorCode===================

apigit=$(cat /etc/access/key.txt)
emailgit=$(cat /etc/access/gmail.txt)

function regip(){
clear
echo -e ""
echo -e "${CYAN}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                  [ REG IP VPS ]                  \E[0m"
echo -e "${CYAN}╘══════════════════════════════════════════════════╛${NC}"
rm -rf /root/izin
read -p " Input IP VPS : " daftar
echo -e ""
echo -e " [ ${rd}INFO${NC} ] • Checking the IP VPS!"
sleep 2
REQIP=$(curl -sS https://raw.githubusercontent.com/jalgitap/izin/main/ipuser | awk '{print $4}' | grep $daftar)
if [[ $daftar = $REQIP ]]; then
echo -e " [ ${rd}INFO${NC} ] • IP VPS Already Registered!!"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
other
else
echo -e " [ ${rd}INFO${NC} ] • OK! IP VPS is not Registered!"
sleep 1
echo -e " [ ${rd}INFO${NC} ] • Lets Register it!"
sleep 3
clear
fi
echo -e "${CYAN}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                  [ REG IP VPS ]                  \E[0m"
echo -e "${CYAN}╘══════════════════════════════════════════════════╛${NC}"
read -p " Client Name : " client
if [ -z $client ]; then
cd
echo -e " [ ${rd}INFO${NC} ] • Please Input client name"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Admin"
license
fi

clear
sleep 1
echo -e " [ ${green}OKEY${NC} ] ${mg}•${NC} ApiKey Succesfully Verifikasi"
sleep 1
clear
echo -e ""
echo -e "---------------------------------------------------" | lolcat
echo -e "Format [ ${green}Tahun-Bulan-Tanggal${NC} ]"
echo -e "Contoh Ada Di Bawah :"
echo -e "[ ${rd}2022-01-01${NC} ] 1 Days Bulan 1"
echo -e "[ ${rd}2022-01-30${NC} ] 30 Days Bulan 1"
echo -e "---------------------------------------------------" | lolcat
read -p "Input Exp Date : " exp

sleep 1
exp=$(date -d "$exp days" +"%Y-%m-%d")
hariini=$(date -d "0 days" +"%Y-%m-%d")
git config --global user.email "${emailgit}" &> /dev/null
git config --global user.name "jalgitap" &> /dev/null
git clone https://github.com/jalgitap/izin.git &> /dev/null
cd /root/izin/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch ipuser &> /dev/null
touch newuser &> /dev/null
TEXT="
Name        : $client 
Exp         : $exp 
IPVPS       : $daftar 
Reg Date    : $hariini
" 
echo "${TEXT}" >>/root/izin/newuser 
echo "### $client $exp $daftar" >>/root/izin/ipuser
git add .
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/jalgitap/izin.git &> /dev/null
git push -f https://${apigit}@github.com/jalgitap/izin.git &> /dev/null
sleep 1
clear
echo -e "${CYAN} Thanks Your For Our Using Service ${NC}"
echo -e "${CYAN}===================================${NC}"
echo -e "[ ${rd}Note${NC} ] • Success Register IP VPS"
echo -e ""
echo -e "Client Name   : $client"
echo -e "IP VPS        : $daftar"
echo -e "Register Date : $hariini"
echo -e "Expired Date  : $exp"
cd
rm -rf /root/izin
echo -e "${CYAN}===================================${NC}"
echo ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Admin"
license

}

function renip(){
clear
echo -e ""
echo -e "${cyan}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                 RENEW ACCESS SCRIPT              \E[0m"
echo -e "${cyan}╘══════════════════════════════════════════════════╛${NC}"
rm -rf /root/izin
git config --global user.email "${emailgit}" &> /dev/null
git config --global user.name "jalgitap" &> /dev/null
git clone https://github.com/jalgitap/izin.git
cd /root/izin/
rm -rf .git
git init
touch ipuser
echo -e "   [ ${green}INFO${NC} ] Checking list.."

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/root/izin/ipuser")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
  clear
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "            ${red}Please Input Correct Number!${NC}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Admin"
license
fi
clear
echo -e "${cyan}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                 RENEW ACCESS SCRIPT              \E[0m"
echo -e "${cyan}╘══════════════════════════════════════════════════╛${NC}"
grep -E "^### " "/root/izin/ipuser" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
  if [[ ${CLIENT_NUMBER} == '1' ]]; then
    read -rp "Select one client [1]: " CLIENT_NUMBER
  else
    read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
  fi
if [ -z $CLIENT_NUMBER ]; then
cd
clear
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "            ${red}Please Input Correct Number!${NC}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Admin"
license
fi
done
echo -e ""
read -p "Expired (days): " masaaktif
if [ -z $masaaktif ]; then
cd
clear
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "            ${red}Please Input Correct Number!${NC}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Admin"
license
fi
name1=$(grep -E "^### " "/root/izin/ipuser" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p) #name
exp=$(grep -E "^### " "/root/izin/ipuser" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p) #exp
ivps1=$(grep -E "^### " "/root/izin/ipuser" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p) #ip

now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
exp3=$(($exp2 + $masaaktif))
exp4=$(date -d "$exp3 days" +"%Y-%m-%d")
sed -i "s/### $name1 $exp $ivps1/### $name1 $exp4 $ivps1/g" /root/izin/ipuser
git add .
git commit -m renew
git branch -M main
git remote add origin https://github.com/jalgitap/izin.git
git push -f https://${apigit}@github.com/jalgitap/izin.git
clear
echo -e "     ${red}Thanks You For Using AutoScript${NC}"
echo -e "${cyan}==========================================${NC}"
echo -e "[ ${red}Note${NC} ] • Client IP Succesfully Renewal"
echo -e ""
echo -e "Renew Date   : $now"
echo -e "IP VPS       : $ivps1"
echo -e "Day Added    : $masaaktif Day"
echo -e "Expired Date : $exp4"
echo -e "Client       : $name1"
echo -e "${cyan}==========================================${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Admin"
license
}

function key(){
clear
rm -rf /etc/admin/gmail.txt
rm -rf /etc/admin/key.txt
if [ ! -f "/etc/access/key.txt" ]; then
read -p "Input Key Admin => " key
read -p "Input Gmail Admin => " gmail
mkdir -p /etc/access/
echo "$key" >/etc/access/key.txt
echo "$gmail" >/etc/access/gmail.txt
echo "DONE..!"
fi
echo -e "${or}--------------------------------------${NC}"
echo -e " ${green}Anda Sudah Mengisi Data Key Admin.!!${NC}"
echo -e " ${green}Silahkan hapus data lama dulu.!!${NC}"
echo -e " ${green}Supaya bisa isi data yang baru.!!${NC}"
echo -e "${or}--------------------------------------${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Admin"
license
}

function delip(){
clear
rm -rf /root/izin &> /dev/null
git config --global user.email "${emailgit}" &> /dev/null
git config --global user.name "jalgitap" &> /dev/null
git clone https://github.com/jalgitap/izin.git &> /dev/null
cd /root/izin/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch ipuser &> /dev/null
clear
echo -e "${CYAN}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                 [ DELETE IP VPS ]                \E[0m"
echo -e "${CYAN}╘══════════════════════════════════════════════════╛${NC}"
echo -e ""
grep -E "^### " "/root/izin/ipuser" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -rp "Please Input Number : " nombor
if [ -z $nombor ]; then
cd
clear
echo -e "${CYAN}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                 [ DELETE IP VPS ]                \E[0m"
echo -e "${CYAN}╘══════════════════════════════════════════════════╛${NC}"
echo -e ""
echo -e " [ ${rd}Note${NC} ] • Please Input Correct Number"
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Admin"
license
fi
clear
sleep 1
echo -e "[ ${green}OKEY${NC} ] • ApiKey Succesfully Verifikasi"

name1=$(grep -E "^### " "/root/izin/ipuser" | cut -d ' ' -f 2 | sed -n "$nombor"p) #name
exp=$(grep -E "^### " "/root/izin/ipuser" | cut -d ' ' -f 3 | sed -n "$nombor"p) #exp
ivps1=$(grep -E "^### " "/root/izin/ipuser" | cut -d ' ' -f 4 | sed -n "$nombor"p) #ip
sed -i "s/### $name1 $exp $ivps1//g" /root/izin/ipuser &> /dev/null
hariini2=$(date -d "0 days" +"%Y-%m-%d")
TEXTD="
Thanks Your For Our Using Service
---------------------------------------
Client Name   : $name1
IP VPS        : $ivps1  
Status        : Deleted $hariini2
---------------------------------------" 
echo "${TEXTD}" >>/root/izin/delete
git add . &> /dev/null
git commit -m remove &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/jalgitap/izin.git &> /dev/null
git push -f https://${apigit}@github.com/jalgitap/izin.git &> /dev/null
clear
echo -e "${CYAN} Thanks Your For Our Using Service ${NC}"
echo -e "${CYAN}===================================${NC}"
echo -e "[ ${rd}Note${NC} ] • Success Deleted IP VPS"
echo -e ""
echo -e "IP VPS       : $ivps1"
echo -e "Expired Date : $exp"
echo -e "Client Name  : $name1"
cd
rm -rf /root/izin
echo -e "${CYAN}===================================${NC}"
echo ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Admin"
license
}
clear
echo -e ""
clear
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[43;1;39m                 ${rd}⇱ ADMIN MENU ⇲                   \E[0m"
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${rd}1${NC} • Register Add IP"
echo -e " ${rd}2${NC} • Register Renew IP"
echo -e " ${rd}3${NC} • Register Delete IP"
echo -e " ${rd}4${NC} • Settings Key Admin"
echo -e " ${rd}5${NC} • Hapus Data Admin"
echo -e ""
echo -e " ${rd}0.${NC} Back To Menu ${yl}•${NC}${or}•${NC}${CYAN}•${NC}"
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p "Input Your Choose : "  opt
echo -e   ""
case $opt in
1)
regip
;;
2)
renip
;;
3)
delip
;;
4)
key
;;
5)
echo -e "${or}Proses Hapus Data Key Admin${NC}"
rm -rf /etc/access/key.txt
sleep 1
echo -e "${or}Proses Hapus Data Gmail Admin${NC}"
rm -rf /etc/access/gmail.txt
sleep 1
echo -e "${green}Berhasil Menghapus Data Admin${NC}"
esac

       
