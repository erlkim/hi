#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################


x="ok"

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
rekk='XRAY'
bec='xray'
else
rekk='V2RAY'
bec='v2ray'
fi

Exp=$(curl -sS https://raw.githubusercontent.com/erlkim/key/main/ip | grep $MYIP | awk '{print $3}')
Name=$(curl -sS https://raw.githubusercontent.com/erlkim/key/main/ip | grep $IPVPS | awk '{print $2}')
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
chck_b(){
	PID=`ps -ef |grep -v grep | grep scvps_bot |awk '{print $2}'`
	if [[ ! -z "${PID}" ]]; then
			sts="\033[0;32m◉ \033[0m"
		else
			sts="\033[1;31m○ \033[0m"
    fi
}
chck_b
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m|              • SCRIPT VPS MENU •               |\E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
serverV=$( curl -sS https://raw.githubusercontent.com/erlkim/key/main/versi)

if [ "$cekup" = "day" ]; then
echo -e "System Uptime   :  $uphours $upminutes $uptimecek"
else
echo -e "System Uptime   :  $uphours $upminutes"
fi
echo -e "Use Core        :  $rekk"
echo -e "Current Domain  :  $(cat /etc/$bec/domain)"
echo -e "IP-VPS          :  $(cat /etc/myipvps)"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Total Openvpn   : $JUMLAH user"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "
 [\033[1;36m01\033[0m] • SSH & OVPN
 [\033[1;36m02\033[0m] • $rekk : VMess / VLess
 [\033[1;36m03\033[0m] • TROJAN-GFW & GO
 [\033[1;36m04\033[0m] • WIREGUARD
 [\033[1;36m05\033[0m] • SSTP
 [\033[1;36m06\033[0m] • L2TP / PPTP
 [\033[1;36m07\033[0m] • SHADOWSOCKS obfs/ssr
 [\033[1;36m09\033[0m] • CREATE VLESS TCP XTLS

 [\033[1;36m55\033[0m] • Trial Generator
 [\033[1;36m66\033[0m] • Logs User Created
 [\033[1;36m77\033[0m] • VPS Setting [ Menu ]
 [\033[1;36m88\033[0m] • Autokill Multi-login [ Menu ]
 [\033[1;36m99\033[0m] • ALL Information VPS[ Menu ]

 [\033[1;36m100\033[0m] • SYSTEM / Admin [ Menu ]
 [\033[1;36m700\033[0m] • Bot-Panel $sts
"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       ssh-menu
    elif [[ $x -eq 2 ]]; then
       v2ray-menu
    elif [[ $x -eq 3 ]]; then
       trojan-menu
    elif [[ $x -eq 4 ]]; then
       wg-menu
    elif [[ $x -eq 5 ]]; then
       sstp-menu
    elif [[ $x -eq 6 ]]; then
       ipsec-menu
    elif [[ $x -eq 7 ]]; then
       ss-menu
    elif [[ $x -eq 9 ]]; then
       addxtls
    elif [[ $x -eq 55 ]]; then
       trial-menu
    elif [[ $x -eq 66 ]]; then
       clear
       cat /etc/log-create-user.log
       read -n 1 -s -r -p "Press any key to back on menu"
       menu
    elif [[ $x -eq 77 ]]; then
       setting-menu
    elif [[ $x -eq 88 ]]; then
       autokill-menu
    elif [[ $x -eq 99 ]]; then
       info-menu
    elif [[ $x -eq 100 ]]; then
       system-menu
    elif [[ $x -eq 700 ]]; then
       installbot
    else
       menu
    fi
else
    if [[ $x -eq 999 ]]; then
       wget -q -O /usr/bin/update-script "https://raw.githubusercontent.com/erlkim/hi/main/dll/system/update-script.sh" && chmod +x /usr/bin/update-script
       screen -S upds update-script
       menu
    elif [[ $x -eq 1 ]]; then
       ssh-menu 
    elif [[ $x -eq 2 ]]; then
       v2ray-menu
    elif [[ $x -eq 3 ]]; then
       trojan-menu
    elif [[ $x -eq 4 ]]; then
       wg-menu
    elif [[ $x -eq 5 ]]; then
       sstp-menu
    elif [[ $x -eq 6 ]]; then
       ipsec-menu
    elif [[ $x -eq 7 ]]; then
       ss-menu
    elif [[ $x -eq 9 ]]; then
       addxtls
    elif [[ $x -eq 55 ]]; then
       trial-menu
    elif [[ $x -eq 66 ]]; then
       clear
       cat /etc/log-create-user.log
       read -n 1 -s -r -p "Press any key to back on menu"
       menu
    elif [[ $x -eq 77 ]]; then
       setting-menu 
    elif [[ $x -eq 88 ]]; then
       autokill-menu
    elif [[ $x -eq 99 ]]; then
       info-menu
    elif [[ $x -eq 100 ]]; then
       system-menu
    elif [[ $x -eq 700 ]]; then
       installbot
    else
       menu
    fi
fi
