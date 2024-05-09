#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
green="\033[0;32m"
red="\033[0;31m"
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/jalgitap/izin/main/ipuser > /root/tmp
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
Name=$(curl -sS https://raw.githubusercontent.com/jalgitap/izin/main/ipuser | grep $MYIP | awk '{print $2}')
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
    IZIN=$(curl -sS https://raw.githubusercontent.com/jalgitap/izin/main/ipuser | awk '{print $4}' | grep $MYIP)
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
${green}Notif By AutoScript Xray-SSH${NC}
--------------------------------------------------------
You IP ( ${red}${MYIP}${NC} ) blocked By AutoScript
${green}The script you are currently using is out of date${NC}
${green}Please contact the admin to extend the duration${NC}
${O}My Telegram :${NC} @WaanSuka_Turu
--------------------------------------------------------
"
echo -e ""
exit 0
fi

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGREEN='\033[1;92m'      # GREEN
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGREEN='\033[0;92m'       # GREEN
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export multi='\E[44;1;39m'
export NC='\033[0m'
export rd='\e[31;1m'
GREEN() { echo -e "\\033[32;1m${*}\\033[0m"; }
RED() { echo -e "\\033[31;1m${*}\\033[0m"; }
# // My Code
IP=$(curl -sS ipv4.icanhazip.com)
apigit=$(cat /etc/settbackup/github_token)
emailgit=$(cat /etc/settbackup/github_email)
gue=$(cat /etc/settbackup/userid)
dia=$(cat /etc/settbackup/bot_token)
domainname=$(cat /etc/xray/domain)
namegit=$(cat /etc/settbackup/github_name)
reponame=$(cat /etc/settbackup/github_repo)
date=$(date +"%Y-%m-%d")
# // My code v.2
token_git_v2=$(cat /etc/settbackup/github_token_v2)
email_v2=$(cat /etc/settbackup/github_email_v2)
token_bot_v2=$(cat /etc/settbackup/bottoken_v2)
userid_v2=$(cat /etc/settbackup/useridd_v2)

clear
function backup_v1(){
clear
if [ -f "/etc/settbackup/github_token" ]; then
NameUser=bckp`</dev/urandom tr -dc X-Z0-9 | head -c4`
read -rp "$(echo -e "${IWhite}Server Name : ${NC}")" -e servername
InputPass=$(tr -dc Q-Xa-y0-9 </dev/urandom | head -c 10 ; echo '')
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "[${GREEN}*${NC}] Processing... "
mkdir -p /root/backup
sleep 1


cp -r /etc/settbackup /root/backup/settbackup/ &> /dev/null
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/xray /root/backup/xray/ &> /dev/null
cp -r /etc/trojan-go /root/backup/trojan-go/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /var/lib/fsidvpn/ /root/backup/fsidvpn &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -rP $InputPass $NameUser.zip backup > /dev/null 2>&1

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/${namegit}/${reponame}.git /root/user-backup/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /root/user-backup/$NameUser
}

Input_Data_Append () {
if [ ! -f "/root/user-backup/$NameUser/$NameUser-last-backup" ]; then
touch /root/user-backup/$NameUser/$NameUser-last-backup
fi
echo -e "User         : $NameUser
last-backup : $LLatest
" >> /root/user-backup/$NameUser/$NameUser-last-backup
mv /root/$NameUser.zip /root/user-backup/$NameUser/
}

Save_And_Exit () {
    cd /root/user-backup
    git config --global user.email "${emailgit}" &> /dev/null
    git config --global user.name "${namegit}" &> /dev/null
    rm -fr .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/${namegit}/${reponame}
    git push -f https://${apigit}@github.com/${namegit}/${reponame}.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "[${GREEN}*${NC}] Getting database... "
Get_Data
Mkdir_Data
sleep 0.5
echo -e "[${GREEN}*${NC}] Getting info server... "
Input_Data_Append
sleep 0.5
echo -e "[${GREEN}*${NC}] Processing updating server...... "
Save_And_Exit
fi
link="https://raw.githubusercontent.com/${namegit}/${reponame}/main/${NameUser}/${NameUser}.zip"
sleep 0.5
echo -e "[${GREEN}*${NC}] Backup done "
sleep 1
echo -e "
${RED}Berikut dibawah ini adalah link backup anda${NC}
${GREEN}$link${NC}"
html="
<b>====🍀Backup Manual🍀====</b>
────────────────────
<i>Domain     : ${domainname}</i>
<i>My IP         : ${IP}</i>
<i>Server       : ${servername}</i>
<i>Name        : ${NameUser}</i>
<i>Password : ${InputPass}</i>
────────────────────
<i>${link}</i>
────────────────────
"
curl -s --max-time 10 -d "chat_id=${gue}r&disable_web_page_preview=1&text=${html}&parse_mode=html" https://api.telegram.org/bot${dia}/sendMessage >/dev/null

rm -fr /root/backup &> /dev/null
rm -fr /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
cd
echo
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu"
backup
exit 0
fi
echo -e "-------------------------------------------------" | lolcat
echo -e "      ${IWhite}Github token and email not available${NC}"
echo -e "            ${IWhite}Please setting first.!!${NC}"
echo -e "-------------------------------------------------" | lolcat
echo -e ""
read -p "Go to settings ?? Y/N : " settd
echo -e ""
case $settd in
y | Y)
sett_data_v1
;;
n | N)
backup
esac
}

function auto_backup_v1(){
clear
if [ -f "/etc/settbackup/github_token" ]; then
echo -e "--------------------------------------------------" | lolcat
echo -e "               ${IWhite}Note for auto backup"
echo -e "        ${CYAN}Y${NC} = ${IWhite}Start${NC} | ${RED}N${NC} = ${IWhite}Stop${NC} | ${IYellow}B${NC} = ${IWhite}Back${NC}"
echo -e "--------------------------------------------------" | lolcat
echo -e ""
read -p "Option Y/N/B : " opsiyn
echo -e ""
case $opsiyn in
y | Y)
clear
echo "# AutobackupV1" >>/etc/cron.d/autobckpv1
echo "0 5 * * * root autov1" >>/etc/cron.d/autobckpv1
clear
sleep 1
echo -e "${GREEN}Auto backup started on 05:00${NC}"
;;
n | N)
clear
rm -rf /etc/cron.d/autobckpv1
sleep 1
echo -e "${GREEN}Auto backup stopped${NC}"
;;
b | B)
backup
esac
exit 0
fi
echo -e "-------------------------------------------------" | lolcat
echo -e "      ${IWhite}Github token and email not available${NC}"
echo -e "            ${IWhite}Please setting first.!!${NC}"
echo -e "-------------------------------------------------" | lolcat
echo -e ""
read -p "Go to settings ?? Y/N : " settd
echo -e ""
case $settd in
y | Y)
sett_data_v1
;;
n | N)
backup
esac
}

function restore_v1(){
clear
if [ -f "/etc/settbackup/github_token" ]; then
read -rp "Input Backup Name  : " -e NameUser
cekdata=$(curl -sS https://raw.githubusercontent.com/${namegit}/${reponame}/main/$NameUser/$NameUser.zip | grep 404 | awk '{print $1}' | cut -d: -f1)

[[ "$cekdata" = "404" ]] && {
echo -e "${IRed}Backup name $NameUser not available.!${NC}"
exit 0
} || {
GREEN "Backup name $NameUser available.!"
}
echo ""
read -rp "Password Backup    : " -e InputPass
echo ""
echo -e "[${RED}*${NC}] • Restore Data..."
sleep 1
echo -e "[${RED}*${NC}] • Downloading data.."
mkdir -p /root/backup
wget -q -O /root/backup/backup.zip "https://raw.githubusercontent.com/${namegit}/${reponame}/main/$NameUser/$NameUser.zip" &> /dev/null
echo -e "[${RED}*${NC}] • Getting your data..."
unzip -P $InputPass /root/backup/backup.zip &> /dev/null
echo -e "[${RED}*${NC}] • Starting to restore data..."
rm -f /root/backup/backup.zip &> /dev/null
sleep 1
cd /root/backup
echo -e "[${RED}*${NC}] • Restoring passwd data..."
sleep 1
cp -r /root/backup/passwd /etc/ &> /dev/null
echo -e "[${RED}*${NC}] • Restoring group data..."
sleep 1
cp -r /root/backup/group /etc/ &> /dev/null
echo -e "[${RED}*${NC}] • Restoring shadow data..."
sleep 1
cp -r /root/backup/shadow /etc/ &> /dev/null
echo -e "[${RED}*${NC}] • Restoring gshadow data..."
sleep 1
cp -r /root/backup/gshadow /etc/ &> /dev/null
echo -e "[${RED}*${NC}] • Restoring chap-secrets data..."
sleep 1
cp -r /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "[${RED}*${NC}] • Restoring passwd1 data..."
sleep 1
cp -r /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null
sleep 1
echo -e "[${RED}*${NC}] • Restoring xray data.."
cp -r /root/backup/xray /etc/ &> /dev/null
sleep 1
echo -e "[${RED}*${NC}] • Restoring etc data.."
cp -r /root/backup/settbackup /etc/ &> /dev/null
cp -r /root/backup/show /etc/ &> /dev/null
cp -r /root/backup/trojan-go /etc/ &> /dev/null
cp -r /root/backup/fsidvpn /var/lib/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
cp -r /root/backup/conf.d /etc/nginx/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
rm -fr /root/backup &> /dev/null
echo -e "[ ${GREEN}Success${NC} ] • Done..."
sleep 1
rm -f /root/backup/backup.zip &> /dev/null
cd
clear
echo -e "${GREEN}Change password, please input new password${NC}"
echo -e ""
passwd
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu"
backup
exit 0
fi
echo -e "-------------------------------------------------" | lolcat
echo -e "      ${IWhite}Github token and email not available${NC}"
echo -e "            ${IWhite}Please setting first.!!${NC}"
echo -e "-------------------------------------------------" | lolcat
echo -e ""
read -p "Go to settings ?? Y/N : " settd
echo -e ""
case $settd in
y | Y)
sett_data_v1
;;
n | N)
backup
esac
}

function sett_data_v1(){
clear
if [ -f "/etc/settbackup/github_token" ]; then
echo -e "-------------------------------------------------" | lolcat
echo -e "      ${IWhite}Github token and email is available${NC}"
echo -e "         ${IWhite}Please dont settings again.!!${NC}"
echo -e "-------------------------------------------------" | lolcat
echo ""
read -p "Remove data ? Y/N : " removeoption
echo -e ""
case $removeoption in
y | Y)
rm -rf /etc/settbackup
sleep 1
echo "Done"
echo ""
;;
n | N)
backup
esac
exit 0
fi
read -p "Input github token : " git_token
sleep 0.2
read -p "Input github email : " git_email
sleep 0.2
read -p "Input github repo  : " git_repo
sleep 0.2
read -p "Input github name  : " git_name
sleep 0.2
read -p "Input bot token    : " bot_tokenn
sleep 0.2
read -p "Input user id      : " user_idd
sleep 1
rm -rf /etc/settbackup
mkdir -p /etc/settbackup/
echo "$git_token" >/etc/settbackup/github_token
echo "$git_email" >/etc/settbackup/github_email
echo "$git_repo" >/etc/settbackup/github_repo
echo "$git_name" >/etc/settbackup/github_name
echo "$bot_tokenn" >/etc/settbackup/bot_token
echo "$user_idd" >/etc/settbackup/userid
echo ""
echo "Settings data done"
echo ""
}

function backup_v2(){
clear
if [ -f "/etc/settbackup/github_token_v2" ]; then
NameUser=bckp`</dev/urandom tr -dc X-Z0-9 | head -c4`
read -rp "$(echo -e "${IWhite}Server Name : ${NC}")" -e servername
InputPass=$(tr -dc Q-Xa-y0-9 </dev/urandom | head -c 10 ; echo '')
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "[${GREEN}*${NC}] Processing... "
mkdir -p /root/backup
sleep 1


cp -r /etc/settbackup /root/backup/settbackup/ &> /dev/null
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/xray /root/backup/xray/ &> /dev/null
cp -r /etc/trojan-go /root/backup/trojan-go/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /var/lib/fsidvpn/ /root/backup/fsidvpn &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -rP $InputPass $NameUser.zip backup > /dev/null 2>&1

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/jalgitap/MaBackup.git /root/user-backup/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /root/user-backup/$NameUser
}

Input_Data_Append () {
if [ ! -f "/root/user-backup/$NameUser/$NameUser-last-backup" ]; then
touch /root/user-backup/$NameUser/$NameUser-last-backup
fi
echo -e "
User        : $NameUser
last-backup : $LLatest
" >> /root/user-backup/$NameUser/$NameUser-last-backup
mv /root/$NameUser.zip /root/user-backup/$NameUser/
}

Save_And_Exit () {
    cd /root/user-backup
    git config --global user.email "${email_v2}" &> /dev/null
    git config --global user.name "jalgitap" &> /dev/null
    rm -fr .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/jagitap/MaBackup
    git push -f https://${token_git_v2}@github.com/jalgitap/MaBackup.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "[${GREEN}*${NC}] Getting database... "
Get_Data
Mkdir_Data
sleep 0.5
echo -e "[${GREEN}*${NC}] Getting info server... "
Input_Data_Append
sleep 0.5
echo -e "[${GREEN}*${NC}] Processing updating server...... "
Save_And_Exit
fi
link="https://raw.githubusercontent.com/jalgitap/MaBackup/main/${NameUser}/${NameUser}.zip"
sleep 0.5
echo -e "[${GREEN}*${NC}] Backup done "
sleep 1
echo -e "
${RED}Berikut dibawah ini adalah link backup anda${NC}
${GREEN}$link${NC}"
html="
<b>====🍀Backup Manual🍀====</b>
────────────────────
<i>Domain     : ${domainname}</i>
<i>My IP         : ${IP}</i>
<i>Server       : ${servername}</i>
<i>Name        : ${NameUser}</i>
<i>Password : ${InputPass}</i>
────────────────────
<i>${link}</i>
────────────────────
"
curl -s --max-time 10 -d "chat_id=${userid_v2}r&disable_web_page_preview=1&text=${html}&parse_mode=html" https://api.telegram.org/bot${token_bot_v2}/sendMessage >/dev/null

rm -fr /root/backup &> /dev/null
rm -fr /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
cd
echo
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu"
backup
exit 0
fi
echo -e "-------------------------------------------------" | lolcat
echo -e "      ${IWhite}Github token and email not available${NC}"
echo -e "            ${IWhite}Please setting first.!!${NC}"
echo -e "-------------------------------------------------" | lolcat
echo -e ""
read -p "Go to settings ?? Y/N : " settd
echo -e ""
case $settd in
y | Y)
sett_data_v2
;;
n | N)
backup
esac
}

function start_autobckp_bot(){
if [ -f "/etc/bckp-bot/userid.conf" ]; then
clear
sleep 1
echo "# Autobackup" >>/etc/cron.d/bckpbot
echo "0 18 * * * root autobckpbot" >>/etc/cron.d/bckpbot
systemctl restart cron.service
echo -e "         ${LIGHT}Autobackup started on 18:00${NC}"
echo -e " ${LIGHT}Type /start in bot @skuyrun_bot to get notif${NC}"
echo -e "   ${LIGHT}Check notif bot @skuyrun_bot after 18:00${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back menu"
backup
exit 0
fi
echo -e "------------------------------------------" | lolcat
echo -e "      ${RED}(( Your UserID Not Found ))${NC}"
echo -e "         ${CYAN}Please settings first.!!${NC}"
echo -e "------------------------------------------" | lolcat
echo ""
}

function stop_autobckp_bot(){
clear
if [ -f "/etc/cron.d/bckpbot" ]; then
rm -rf /etc/cron.d/bckpbot
sleep 1
echo -e "
${LIGHT}Autobackup Stopped Successfully...${NC}
"
systemctl restart cron.service
echo ""
exit 0
fi
sleep 1
echo -e "
${LIGHT}Autobackup has been turned off${NC}
"
}

function sett_userid(){
clear
if [ -f "/etc/bckp-bot/userid.conf" ]; then
echo -e "---------------------------------------------" | lolcat
echo -e "              ${LIGHT}UserID Available${NC}"
echo -e "---------------------------------------------" | lolcat
echo ""
exit 0
fi
echo -e "                ${RED}Solution For You${NC}"
echo -e "---------------------------------------------------" | lolcat
echo -e " ${LIGHT}Getting your id, type /info to bot @MissRose_bot${NC}"
echo -e "---------------------------------------------------" | lolcat
echo ""
read -p "Input Your ID : " myid
sleep 0.2
read -p "Server Info   : " servinf
rm -rf /etc/bckp-bot
mkdir -p /etc/bckp-bot/
echo "$myid" >/etc/bckp-bot/userid.conf
echo "$servinf" >/etc/bckp-bot/servinfo.conf
sleep 1
echo -e "
${LIGHT}Settings UserID Successfully....${NC}"
}


function backup_bot(){
clear
echo -e "----------------------------------------------" | lolcat
echo -e "           ${RED}(( OPTION AUTOBACKUP ))${NC}"
echo -e "----------------------------------------------" | lolcat
echo -e "  ${GREEN}1.${NC} = ${LIGHT}Start AutoBackup${NC}
  ${PURPLE}2.${NC} = ${LIGHT}Stop AutoBackup${NC}
  ${CYAN}3.${NC} = ${LIGHT}Settings UserID${NC}"
echo -e "----------------------------------------------" | lolcat
echo ""
read -p "Input Your Choose : " pilihan
echo -e ""
case $pilihan in
1)
start_autobckp_bot
;;
2)
stop_autobckp_bot
;;
3)
sett_userid
esac
}

function restore_v2(){
clear
read -rp "Input Backup Name  : " -e NameUser
cekdata=$(curl -sS https://raw.githubusercontent.com/jalgitap/MaBackup/main/$NameUser/$NameUser.zip | grep 404 | awk '{print $1}' | cut -d: -f1)

[[ "$cekdata" = "404" ]] && {
echo -e "${IRed}Backup name $NameUser not available.!${NC}"
exit 0
} || {
GREEN "Backup name $NameUser available.!"
}
echo ""
read -rp "Password Backup    : " -e InputPass
echo ""
echo -e "[${RED}*${NC}] • Restore Data..."
sleep 1
echo -e "[${RED}*${NC}] • Downloading data.."
mkdir -p /root/backup
wget -q -O /root/backup/backup.zip "https://raw.githubusercontent.com/jalgitap/MaBackup/main/$NameUser/$NameUser.zip" &> /dev/null
echo -e "[${RED}*${NC}] • Getting your data..."
unzip -P $InputPass /root/backup/backup.zip &> /dev/null
echo -e "[${RED}*${NC}] • Starting to restore data..."
rm -f /root/backup/backup.zip &> /dev/null
sleep 1
cd /root/backup
echo -e "[${RED}*${NC}] • Restoring passwd data..."
sleep 1
cp -r /root/backup/passwd /etc/ &> /dev/null
echo -e "[${RED}*${NC}] • Restoring group data..."
sleep 1
cp -r /root/backup/group /etc/ &> /dev/null
echo -e "[${RED}*${NC}] • Restoring shadow data..."
sleep 1
cp -r /root/backup/shadow /etc/ &> /dev/null
echo -e "[${RED}*${NC}] • Restoring gshadow data..."
sleep 1
cp -r /root/backup/gshadow /etc/ &> /dev/null
echo -e "[${RED}*${NC}] • Restoring chap-secrets data..."
sleep 1
cp -r /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "[${RED}*${NC}] • Restoring passwd1 data..."
sleep 1
cp -r /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null
sleep 1
echo -e "[${RED}*${NC}] • Restoring xray data.."
cp -r /root/backup/xray /etc/ &> /dev/null
sleep 1
echo -e "[${RED}*${NC}] • Restoring etc data.."
cp -r /root/backup/settbackup /etc/ &> /dev/null
cp -r /root/backup/show /etc/ &> /dev/null
cp -r /root/backup/trojan-go /etc/ &> /dev/null
cp -r /root/backup/fsidvpn /var/lib/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
cp -r /root/backup/conf.d /etc/nginx/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
rm -fr /root/backup &> /dev/null
echo -e "[ ${GREEN}Success${NC} ] • Done..."
sleep 1
rm -f /root/backup/backup.zip &> /dev/null
cd
clear
echo -e "${GREEN}Change password, please input new password${NC}"
echo -e ""
passwd
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu"
backup
}

function sett_data_v2(){
clear
if [ -f "/etc/settbackup/github_token_v2" ]; then
echo -e "-------------------------------------------------" | lolcat
echo -e "      ${IWhite}Github token and email is available${NC}"
echo -e "         ${IWhite}Please dont settings again.!!${NC}"
echo -e "-------------------------------------------------" | lolcat
echo ""
read -p "Remove data ? Y/N : " removeoption
echo -e ""
case $removeoption in
y | Y)
rm -rf /etc/settbackup
sleep 1
echo "Done"
echo ""
;;
n | N)
backup
esac
exit 0
fi
read -p "Input github token : " git_token_v2
sleep 0.2
read -p "Input github email : " git_email_v2
sleep 0.2
read -p "Input bot token    : " bot_token_v2
sleep 0.2
read -p "Input user id      : " userid_v2
sleep 1
rm -rf /etc/settbackup
mkdir -p /etc/settbackup/
echo "$git_token_v2" >/etc/settbackup/github_token_v2
echo "$git_email_v2" >/etc/settbackup/github_email_v2
echo "$bot_token_v2" >/etc/settbackup/bottoken_v2
echo "$userid_v2" >/etc/settbackup/useridd_v2
echo ""
echo "Settings done"
echo ""
}

function restore_from_bot(){
clear
echo -e "
${LIGHT}Upload files backup to your github accounts
        And get your link backup${NC}"
echo ""
read -p "Input Your Link Backup   : " your_url
sleep 0.3
read -p "Input Your Passwd Backup : " pw_exstrak
sleep 1
rm -rf /root/backup
mkdir -p /root/backup
wget -q -O /root/backup/backup.zip "${your_url}"
sleep 0.5
echo -e "${CYAN}Progress extstrak backup files...${NC}"
unzip -P $pw_exstrak /root/backup/backup.zip &> /dev/null
echo -e "${LIGHT}Starting restore your data..."
rm -f /root/backup/backup.zip
sleep 1.5
cd /root/backup
echo -e "${LIGHT}Restoring passwd data..."
sleep 1
cp -r /root/backup/passwd /etc/ &> /dev/null
echo -e "${LIGHT}Restoring group data..."
sleep 1
cp -r /root/backup/group /etc/ &> /dev/null
echo -e "${LIGHT}Restoring shadow data..."
sleep 1
cp -r /root/backup/shadow /etc/ &> /dev/null
echo -e "${LIGHT}Restoring gshadow data..."
sleep 1
cp -r /root/backup/gshadow /etc/ &> /dev/null
echo -e "${LIGHT}Restoring chap-secrets data..."
sleep 1
cp -r /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "${LIGHT}Restoring passwd1 data..."
sleep 1
cp -r /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null
sleep 1
echo -e "${LIGHT}Restoring xray data..."
cp -r /root/backup/xray /etc/ &> /dev/null
sleep 1
echo -e "${LIGHT}Restoring etc data..."
cp -r /root/backup/settbackup /etc/ &> /dev/null
cp -r /root/backup/show /etc/ &> /dev/null
cp -r /root/backup/trojan-go /etc/ &> /dev/null
cp -r /root/backup/fsidvpn /var/lib/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
cp -r /root/backup/conf.d /etc/nginx/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
rm -fr /root/backup &> /dev/null
echo -e "[ ${CYAN}Success${NC} ] • Done..."
echo -e "
Please change new password, input new password"
echo ""
passwd
echo -e "Done"
}

clear
echo -e "
${CYAN}───────────────────────────────────────────────${NC}
  ${multi}             ${rd}Backup / Restore              ${NC}
${CYAN}───────────────────────────────────────────────${NC}"
echo -e "  ${LIGHT}Choose V.1 so it can work.!!${NC}"
echo -e "
 ${RED}1.)${NC} Backup       | ${CYAN}V.1${NC}
 ${RED}2.)${NC} Auto Backup  | ${CYAN}V.1${NC}
 ${RED}3.)${NC} Restore      | ${CYAN}V.1${NC}
 ${RED}4.)${NC} Sett Data    | ${CYAN}V.1${NC}"
 echo -e "
 ${RED}5.)${NC} Backup       | ${CYAN}V.2${NC}
 ${RED}6.)${NC} Auto Backup  | ${CYAN}V.2${NC}
 ${RED}7.)${NC} Restore      | ${CYAN}V.2${NC}
 ${RED}8.)${NC} Sett Data    | ${CYAN}V.2${NC}
 ${RED}9.)${NC} Restore backup from bot"
echo -e "
${GREEN}input data is required first!!${NC}
${CYAN}───────────────────────────────────────────────${NC}"
echo "Tap Enter To Back Home-Menu"
echo ""
read -p "Select menu : " opt
echo -e ""
case $opt in
1) clear ; backup_v1;;
2) clear ; auto_backup_v1;;
3) clear ; restore_v1;;
4) clear ; sett_data_v1;;
5) clear ; backup_v2;;
6) clear ; backup_bot;;
7) clear ; restore_v2;;
8) clear ; sett_data_v2;;
9) clear ; restore_from_bot;;
x) exit ;;
*) echo -e "" ; echo "Back To Menu" ; sleep 1 ; menu ;;
esac
