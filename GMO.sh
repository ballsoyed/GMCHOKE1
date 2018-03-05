#! / bin / ทุบตี

#ไปที่ราก
ซีดี

# disable ipv6
echo 1 > / proc / sys / net / ipv6 / conf / ทั้งหมด / disable_ipv6
sed -i ' $ i \ echo 1> / proc / sys / net / ipv6 / conf / ทั้งหมด / disable_ipv6 ' /etc/rc.local

#ติดตั้ง wget และ curl
apt-get update ; apt-get -y ติดตั้ง wget curl ;

#ตั้งเวลา GMT +7
ln -fs / usr / share / zoneinfo / Asia / Jakarta / etc / localtime

#ตั้งค่าภาษา
sed -i ' / AcceptEnv / # AcceptEnv / g ' / etc / ssh / sshd_config
บริการ ssh restart

# repo ชุด
wget -O /etc/apt/sources.list " https://raw.github.com/arieonline/autoscript/master/conf/sources.list.debian7 "
wget " http://www.dotdeb.org/dotdeb.gpg "
cat dotdeb.gpg | apt-key เพิ่ม - ; rm dotdeb.gpg

# remove unused
apt-get -y --purge ลบ samba * ;
apt-get -y --purge ลบ apache2 * ;
apt-get -y --purge ลบ sendmail * ;
apt-get -y --purge ลบ bind9 * ;

# update
apt-get update ; apt-get -y upgrade ;

#ติดตั้งเว็บเซิร์ฟเวอร์
apt-get -y ติดตั้ง nginx php5-fpm php5-cli

#ติดตั้งชุดที่จำเป็น
apt-get -y ติดตั้ง bmon iftop htop nmap axel nano iptables traceroute sysv-rc-conf dnsutils bc nethogs openvpn vnstat หน้าจอน้อย psmisc apt-file whois ptunnel ngrep mtr git zsh mrtg snmp snmpd snmp-mibs- ดาวน์โหลด unzip unrar rsyslog debsums rkhunter
apt-get -y ติดตั้ง build-essential

# disable exim
บริการ exim4 stop
sysv-rc-conf exim4 ปิด

# update apt-file
apt-file update

#การตั้งค่า vnstat
vnstat -u -i venet0
บริการ vnstat เริ่มต้นใหม่

# install screenfetch
ซีดี
wget https://github.com/KittyKatt/screenFetch/raw/master/screenfetch-dev
mv screenfetch-dev / usr / bin / screenfetch
chmod + x / usr / bin / screenfetch
echo  " clear "  >> .profile
ก้อง " screenfetch "  >> .profile

#ติดตั้งเว็บเซิร์ฟเวอร์
ซีดี
rm / etc / nginx / sites-enabled / default
rm / etc / nginx / sites-available / default
wget -O /etc/nginx/nginx.conf " https://raw.github.com/arieonline/autoscript/master/conf/nginx.conf "
mkdir -p / home / vps / public_html
echo  " <pre> การตั้งค่าโดย KangArie | JualSSH.com | @arieonline | 7946F434 </ pre> "  > /home/vps/public_html/index.html
echo  " <? php phpinfo ();?> "  > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf " https://raw.github.com/arieonline/autoscript/master/conf/vps.conf "
sed -i ' s / listen = \ / var \ / run \ /php5-fpm.sock/listen = 127.0.0.1:9000/g ' /etc/php5/fpm/pool.d/www.conf
บริการ php5-fpm restart
เริ่มต้นบริการ nginx ใหม่

# install openvpn
wget -O /etc/openvpn/openvpn.tar " https://raw.github.com/arieonline/autoscript/master/conf/openvpn-debian.tar "
cd / etc / openvpn /
tar xf openvpn.tar
wget -O /etc/openvpn/1194.conf " https://raw.github.com/arieonline/autoscript/master/conf/1194.conf "
บริการ openvpn ใหม่
sysctl -w net.ipv4.ip_forward = 1
sed -i ' s / # net.ipv4.ip_forward = 1 / net.ipv4.ip_forward = 1 / g ' /etc/sysctl.conf
wget -O /etc/iptables.up.rules " https://raw.github.com/arieonline/autoscript/master/conf/iptables.up.rules "
sed -i ' $ i \ iptables- restore </etc/iptables.up.rules ' /etc/rc.local
MYIP = `ขด -s ifconfig.me ` ;
MYIP2 = " s / xxxxxxxxx / $ MYIP / g " ;
sed -i $ MYIP2 /etc/iptables.up.rules ;
iptables-restore < /etc/iptables.up.rules
บริการ openvpn ใหม่

# configure config ไคลเอ็นต์ OpenVPN
cd / etc / openvpn /
wget -O /etc/openvpn/1194-client.ovpn " https://raw.github.com/arieonline/autoscript/master/conf/1194-client.conf "
sed -i $ MYIP2 /etc/openvpn/1194-client.ovpn ;
PASS = ` cat / dev / urandom | tr-dc ' a-zA-Z0-9 '  | พับ -w 15 | หัว -n 1 ` ;
useradd-M -s / bin / false KangArie
echo  " KangArie: $ PASS "  | chpasswd
echo  " KangArie "  > pass.txt
echo  " $ PASS "  >> pass.txt
tar cf client.tar 1194-client.ovpn pass.txt
cp client.tar / home / vps / public_html /
ซีดี
#ติดตั้ง badvpn
wget -O / usr / bin / badvpn-udpgw " https://raw.github.com/arieonline/autoscript/master/conf/badvpn-udpgw "
sed -i ' $ i \ หน้าจอ -AddS badvpn badvpn-udpgw-listen-addr 127.0.0.1:7300 ' /etc/rc.local
chmod + x / usr / bin / badvpn-udpgw
หน้าจอ -AddS badvpn badvpn-udpgw-listen-addr 127.0.0.1:7300

# install mrtg
wget -O /etc/snmp/snmpd.conf " https://raw.github.com/arieonline/autoscript/master/conf/snmpd.conf "
wget -O /root/mrtg-mem.sh " https://raw.github.com/arieonline/autoscript/master/conf/mrtg-mem.sh "
chmod + x /root/mrtg-mem.sh
cd / etc / snmp /
sed -i ' s / TRAPDRUN = ไม่ / TRAPDRUN = yes / g ' / etc / default / snmpd
บริการ snmpd เริ่มต้นใหม่
snmpwalk -v 1 -c localhost สาธารณะ 1.3.6.1.4.1.2021.10.1.3.1
mkdir -p / home / vps / public_html / mrtg
cfgmaker --zero-speed 100000000 - ทั่วโลก' WorkDir: / home / vps / public_html / mrtg ' - ออก /etc/mrtg.cfg public @ localhost
ม้วน" https://raw.github.com/arieonline/autoscript/master/conf/mrtg.conf "  >> /etc/mrtg.cfg
sed -i ' / WorkDir: \ / var \ / www \ / mrtg / # WorkDir: \ / var \ / www \ / mrtg / g ' /etc/mrtg.cfg
sed -i ' s / # Options \ [_ \]: growright, bits / ตัวเลือก \ [_ \]: growright / g ' /etc/mrtg.cfg
indexmaker --output = / home / vps / public_html / mrtg / index.html /etc/mrtg.cfg
ถ้า [ -x / usr / bin / mrtg] && [ -r /etc/mrtg.cfg] ;  แล้ว mkdir -p / var / log / mrtg ; env LANG = C / usr / bin / mrtg /etc/mrtg.cfg 2> & 1  | tee-a/var/log/mrtg/mrtg.log ;  Fi
ถ้า [ -x / usr / bin / mrtg] && [ -r /etc/mrtg.cfg] ;  แล้ว mkdir -p / var / log / mrtg ; env LANG = C / usr / bin / mrtg /etc/mrtg.cfg 2> & 1  | tee-a/var/log/mrtg/mrtg.log ;  Fi
ถ้า [ -x / usr / bin / mrtg] && [ -r /etc/mrtg.cfg] ;  แล้ว mkdir -p / var / log / mrtg ; env LANG = C / usr / bin / mrtg /etc/mrtg.cfg 2> & 1  | tee-a/var/log/mrtg/mrtg.log ;  Fi
ซีดี

#การตั้งค่าพอร์ต ssh
sed -i ' / Port 22 / a Port 143 ' / etc / ssh / sshd_config
sed -i ' / พอร์ต 22 / พอร์ต 22 / g ' / etc / ssh / sshd_config
บริการ ssh restart

# dropbear การติดตั้ง
apt-get -y ติดตั้ง dropbear
sed -i ' s / NO_START = 1 / NO_START = 0 / g ' / etc / default / dropbear
sed -i ' s / DROPBEAR_PORT = 22 / DROPBEAR_PORT = 443 / g ' / etc / default / dropbear
sed -i ' s / DROPBEAR_EXTRA_ARGS = / DROPBEAR_EXTRA_ARGS = "- p 109 p 110" / g ' / etc / default / dropbear
echo  " / bin / false "  >> / etc / shells
บริการ ssh restart
เริ่มต้นบริการ dropbear ใหม่

#ติดตั้ง vnstat gui
cd / home / vps / public_html /
wget http://www.sqweek.com/sqweek/files/vnstat_php_frontend-1.5.1.tar.gz
tar xf vnstat_php_frontend-1.5.1.tar.gz
rm vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 vnstat
cd vnstat
sed -i ' / eth0 / venet0 / g ' config.php
sed ' s / \ $ iface_list = array (' venet0 ',' sixxs '); / \ iface_list = array (' venet0 '); / g " config.php
sed -i " s / \ $ภาษา = 'nl'; / \ $ language = 'en' / g " config.php
sed -i ' / ภายใน / Internet / g ' config.php
sed -i ' / SixXS IPv6 / d ' config.php
ซีดี

# install failed2ban
apt-get -y ติดตั้ง fail2ban ; บริการ fail2ban เริ่มใหม่

# install squid3
apt-get -y ติดตั้ง squid3
wget -O /etc/squid3/squid.conf " https://raw.github.com/arieonline/autoscript/master/conf/squid3.conf "
sed -i $ MYIP2 /etc/squid3/squid.conf ;
บริการเริ่มต้นใหม่ squid3

# install webmin
ซีดี
wget " http://prdownloads.sourceforge.net/webadmin/webmin_1.670_all.deb "
dpkg --install webmin_1.670_all.deb ;
apt-get -y-f ติดตั้ง;
rm /root/webmin_1.670_all.deb
บริการ webmin รีสตาร์ท
บริการ vnstat เริ่มต้นใหม่

# downlaod script
ซีดี
wget -O speedtest_cli.py " https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py "
wget -O bench-network.sh " https://raw.github.com/arieonline/autoscript/master/conf/bench-network.sh "
wget -O ps_mem.py " https://raw.github.com/pixelb/ps_mem/master/ps_mem.py "
wget -O limit.sh " https://raw.github.com/arieonline/autoscript/master/conf/limit.sh "
curl http://script.jualssh.com/user-login.sh > user-login.sh
curl http://script.jualssh.com/user-expire.sh > user -expire.sh
curl http://script.jualssh.com/user-limit.sh > user-limit.sh
echo  " 0 0 * * * root /root/user-expire.sh "  > /etc/cron.d/user-expire
sed -i ' $ i \ หน้าจอ -AmdS limit /root/limit.sh ' /etc/rc.local
chmod + x benchnetnet.sh
chmod + x speedtest_cli.py
chmod + x ps_mem.py
chmod + x user-login.sh
chmod + x user -expire.sh
chmod + x ผู้ใช้ --limit.sh
chmod + x limit.sh

# finalisasi
chown -R www-data: www- ข้อมูล / home / vps / public_html
เริ่มบริการ nginx
บริการ php-fpm เริ่มต้น
บริการ vnstat เริ่มต้นใหม่
บริการ openvpn ใหม่
บริการ snmpd เริ่มต้นใหม่
บริการ ssh restart
เริ่มต้นบริการ dropbear ใหม่
บริการ fail2ban เริ่มใหม่
บริการเริ่มต้นใหม่ squid3
บริการ webmin รีสตาร์ท

# info
ชัดเจน
echo  " Darkcenter | @DYP | DYP | 7946F434 "  | tee log-install.txt
echo  " =========================================== "  | ที - a - log - install.txt
echo  " "   | ที - a - log - install.txt
echo  "บริการ"   | ที - a - log - install.txt
echo  " ------- "   | ที - a - log - install.txt
echo  " OpenVPN: TCP 1194 (ไคลเอ็นต์ config: http: // $ MYIP /client.tar) "   | ที - a - log - install.txt
echo  " OpenSSH: 22, 143 "   | ที - a - log - install.txt
echo  " Dropbear: 109, 110, 443 "   | ที - a - log - install.txt
echo  " Squid3: 8080 (จำกัด IP SSH) "   | ที - a - log - install.txt
echo  " badvpn: badvpn-udpgw port 7300 "   | ที - a - log - install.txt
echo  " "   | ที - a - log - install.txt
echo  "เครื่องมือ"   | ที - a - log - install.txt
echo  " ----- "   | ที - a - log - install.txt
echo  " axel "   | ที - a - log - install.txt
echo  " bmon "   | ที - a - log - install.txt
echo  " htop "   | ที - a - log - install.txt
echo  " iftop "   | ที - a - log - install.txt
echo  " mtr "   | ที - a - log - install.txt
echo  " nethogs "   | ที - a - log - install.txt
echo  " "   | ที - a - log - install.txt
echo  " Script "   | ที - a - log - install.txt
echo  " ------ "   | ที - a - log - install.txt
echo  " screenfetch "   | ที - a - log - install.txt
echo  " ./ps_mem.py "   | ที - a - log - install.txt
echo  " ./speedtest_cli.py --share "   | ที - a - log - install.txt
echo  " ./bench-network.sh "   | ที - a - log - install.txt
echo  " ./user-login.sh "   | ที - a - log - install.txt
echo  " ./user-expire.sh "   | ที - a - log - install.txt
echo  " ./user-limit.sh 2 "   | ที - a - log - install.txt
echo  " "   | ที - a - log - install.txt
echo  "ค่าเริ่มต้นบัญชี (utk SSH and VPN) "   | ที - a - log - install.txt
echo  " --------------- "   | ที - a - log - install.txt
echo  "ผู้ใช้: Dimas "   | ที - a - log - install.txt
echo  "รหัสผ่าน: qweasd "   | ที - a - log - install.txt
echo  " "   | ที - a - log - install.txt
ก้อง " Fitur lain "   | ที - a - log - install.txt
echo  " ---------- "   | ที - a - log - install.txt
echo  " Webmin: https: // $ MYIP : 10000 / "   | ที - a - log - install.txt
echo  " vnstat: http: // $ MYIP / vnstat / "   | ที - a - log - install.txt
echo  " MRTG: http: // $ MYIP / mrtg / "   | ที - a - log - install.txt
echo  " Timezone: Asia / Jakarta "   | ที - a - log - install.txt
echo  " Fail2Ban: [on] "   | ที - a - log - install.txt
echo  " IPv6: [ปิด] "   | ที - a - log - install.txt
echo  " "   | ที - a - log - install.txt
echo  "ล็อกไฟล์ Installasi -> /root/log-install.txt "   | ที - a - log - install.txt
echo  " "   | ที - a - log - install.txt
echo  " SILAHKAN REBOOT VPS ANDA! "   | ที - a - log - install.txt
echo  " "   | ที - a - log - install.txt
echo  " =========================================== "   | ที - a - log - install.txt
© 2018 GitHub , Inc.
ข้อตกลงและเงื่อนไข
ความเป็นส่วนตัว
ความปลอดภัย
สถานะ
ช่วยด้วย
ติดต่อ GitHub
API
การอบรม
ร้านขายของ
บล็อก
