﻿#!/bin/bash
#
# Original script by GM# Mod by GM NIPON
# ==================================================
# go to root
cd
sudo apt-get update
#apt-get install ca-certificates
apt-get install zip
apt-get -y install openvpn

# Change to Time GMT+8
ln -fs /usr/share/zoneinfo/Asia/Bangkok /etc/localtime

# install openvpn
wget -O /etc/openvpn/openvpn.tar "https://docs.google.com/uc?export=download&id=1VsWCjCWk0kZWGsc0dHTyV72bSq353aMo"
cd /etc/openvpn/
tar xf openvpn.tar
# Download 1194-2.conf in Google to Save 1194.conf
wget -O /etc/openvpn/1194.conf "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/1194-2.conf"
service openvpn restart
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
iptables -t nat -I POSTROUTING -s 1.1.0.0/24 -o eth0 -j MASQUERADE
iptables-save > /etc/iptables_yg_baru_dibikin.conf
wget -O /etc/network/if-up.d/iptables "https://raw.githubusercontent.com/gmchoke/A/master/iptables"
chmod +x /etc/network/if-up.d/iptables
cp /usr/lib/openvpn/openvpn-plugin-auth-pam.so /etc/openvpn/
mkdir /etc/openvpn/tmp
chmod 777 /etc/openvpn/tmp
/etc/init.d/openvpn restart
#service openvpn status

# download script
cd /usr/bin
wget -O usernew "https://raw.githubusercontent.com/gmchoke/A/master/usernew.sh"
chmod +x usernew
# Add User OpenVPN key: usernew

# Install Squid
apt-get -y install squid3
cp /etc/squid3/squid.conf /etc/squid3/squid.conf.orig
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/gmchoke/A/master/squid.conf"
MYIP=$(wget -qO- ipv4.icanhazip.com);
sed -i s/xxxxxxxxx/$MYIP/g /etc/squid3/squid.conf;
service squid3 restart

# install webmin
cd
#wget -O webmin-current.deb "https://docs.google.com/uc?export=download&id=1R6V8edVQtIeHYdvZB2EH0sGCLRh2sepm"
#dpkg -i --force-all webmin-current.deb;
#apt-get -y -f install;
#rm /root/webmin-current.deb
			#sed -i s/port=10000/port=85/g /etc/webmin/miniserv.conf;
sudo tee -a /etc/apt/sources.list << EOF
deb http://download.webmin.com/download/repository sarge contrib
deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib
EOF
cd /root
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
apt-get update
apt-get install webmin
sed -i s/ssl=1/ssl=0/g /etc/webmin/miniserv.conf;
service webmin restart
