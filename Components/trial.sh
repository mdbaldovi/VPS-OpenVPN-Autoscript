#!/bin/bash
#script to create trial user SSH
#will expired after 1 day


IP=`dig +short myip.opendns.com @resolver1.opendns.com`

Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
day="1"
Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`

useradd -e `date -d "$day days" +"%Y-%m-%d"` -s /bin/false -M $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "--------------------------------------"
echo -e "           Account Details"
echo -e "--------------------------------------"
echo -e "Host: $IP"
echo -e "Username: $Login"
echo -e "Password: $Pass\n"
#echo -e "Port OpenSSH  : 22, 444"
#echo -e "Port Dropbear : 442, 445"
#echo -e "Port Squid3   : 8000, 8080"
echo -e "Download OpenVPN config: http://$IP:81/client.ovpn"
echo -e "========================="
echo -e ""
