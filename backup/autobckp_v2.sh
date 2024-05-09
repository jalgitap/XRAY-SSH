#!/bin/bash
IWhite='\033[0;97m'
NC='\e[0m'
clear
if [ -f "/etc/settbackup/github_token_v2" ]; then
IP=$(curl -sS ipv4.icanhazip.com)
token_git_v2=$(cat /etc/settbackup/github_token_v2)
email_v2=$(cat /etc/settbackup/github_email_v2)
token_bot_v2=$(cat /etc/settbackup/bottoken_v2)
userid_v2=$(cat /etc/settbackup/useridd_v2)
domainname=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")

clear
NameUser=bckp`</dev/urandom tr -dc X-Z0-9 | head -c4`
InputPass=$(tr -dc Q-Xa-y0-9 </dev/urandom | head -c 10 ; echo '')
if [[ -z $InputPass ]]; then
exit 0
fi
mkdir -p /root/backup

cp -r /etc/settbackup /root/backup/settbackup &> /dev/null
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
    git remote add origin https://github.com/jalgitap/MaBackup
    git push -f https://${token_git_v2}@github.com/jalgitap/MaBackup.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
Get_Data
Mkdir_Data
Input_Data_Append
Save_And_Exit
fi
link="https://raw.githubusercontent.com/jalgitap/MaBackup/main/$NameUser/$NameUser.zip"
html="
────────────────────
<b>🍀Backup Auto From Github🍀</b>
────────────────────
<i>Domain     : ${domainname}
My IP         : ${IP}
Password : ${InputPass}
Name        : ${NameUser}</i>
────────────────────
<i>${link}</i>
────────────────────
"
curl -s --max-time 10 -d "chat_id=${userid_v2}r&disable_web_page_preview=1&text=${html}&parse_mode=html" https://api.telegram.org/bot${token_bot_v2}/sendMessage >/dev/null

rm -fr /root/backup &> /dev/null
rm -fr /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
cd
exit 0
fi
clear
echo -e "-------------------------------------------------" | lolcat
echo -e "      ${IWhite}Bot token and user id not available${NC}"
echo -e "            ${IWhite}Please setting first.!!${NC}"
echo -e "-------------------------------------------------" | lolcat
