#!/bin/bash # go to root cd # Install Command apt-get -y install ufw apt-get -y install sudo # set repo wget -O /etc/apt/sources.list "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/sources.list.debian" wget "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/dotdeb.gpg" wget "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/jcameron-key.asc" cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc # update apt-get update # install webserver apt-get -y install nginx # install essential package apt-get -y install nano iptables dnsutils openvpn screen whois ngrep unzip unrar # install neofetch echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key apt-get update apt-get install neofetch echo "clear" >> .bashrc echo 'echo -e "\e[35m============================================\e[0m"' >> .bashrc echo 'echo -e "]======== \e[34mAuto Script By GM CHOKE\e[0m ========["' >> .bashrc echo 'echo -e "\e[31m***** ติดต่อสอบถามได้ที่  Facebook-Line ด้านล่างนี้นะครับ *****\e[0m"' >> .bashrc echo 'echo -e "\e[33mFacebook : nipon kaewtes\e[0m"' >> .bashrc echo 'echo -e "\e[34mLine id  nipon24082535\e[0m"' >> .bashrc echo 'echo -e "]==== [\e[31mคำเตือน\e[0m] : อย่าเล่นมากนะระวังเมียพี่มีชู้นะครับ ====["' >> .bashrc echo 'echo -e "]===== \e[33mScript Debian OS 32 & 64 -bit\e[0m =====["' >> .bashrc echo 'echo -e "]==== พิมพ์ >> [ \e[32mmenu\e[0m ] << Enter เพื่อเเสดงคำสั่งทั้งหมด =====["' >> .bashrc echo 'echo -e "\e[35m============================================\e[0m"' >> .bashrc echo 'echo -e ""' >> .bashrc # install webserver cd rm /etc/nginx/sites-enabled/default rm /etc/nginx/sites-available/default wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/nginx.conf" mkdir -p /home/vps/public_html echo "
A p p O p e n V P N - P R O
-
        
ดาวโหลดแอพSUPERVPN» คลิก «
สนใจติดต่อสอบถาม » คลิก «
การใช้งานแอพเน็ตฟรี» คลิก «
บริการเช่า VPN
บริการเช่า VPN
บริการเช่าVPN ระบบ VPS
ใช้ได้ทั้ง ssh เเละ openvpn
ราคาเพียง  50บาท/เดือน
บริการรันScripVPS
บริการรันScripVPS
debain 7 - 8
ubuntu 14
ค่าบริการ50฿/1เซิฟเวอร์
ขายขาด350
รองรับทุกเวบ-เวบ z.com ก็รันผ่านโดยใช้เวลาเพียง2-3นาที
รีวิวคำสั่ง{menu}.........รายชื่อเมนู
{addkguza} .เพิ่มผู้ใช้
{2} สร้างผู้ใช้ชั่วคราว1ชั่วโมง{ให้ลูกค้าทดสอบไฟล์
{3} เปลี่ยนชื่อผู้ใช้
{4} ตั้งค่าอุปกรณ์และเปลี่ยนรหัสผ่านและเปลี่ยนวันหมดอายุ
{5} ลบผู้ใช้
{6} ลบผู้ใช้โดยอัตโนมัติ ที่หมดอายุ
{7} ดูผู้ใช้ทั้งหมด
{8} เริ่มต้นบริการ dropbear,squid3, OpenVPN และ SSH
{9} speedtest VPS
{10} ดูผู้ใช้ออนไลน์
{11} การเข้าสู่ระบบของผู้ใช้
{12} เกี่ยวกับระบบนี้
{13} เกี่ยวกับการติดตั้งสคริปต์อัตโนมัติ
{reboot} บูต VPS ใหม่
{exit} ปิด Putty / Connecbot / JuiceSSH
ขอบ คุณ ที่ สนับ สนุน บริ การ ของ เรา
" > /home/vps/public_html/index.html wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/vps.conf" service nginx restart # install openvpn wget -O /etc/openvpn/openvpn.sh "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/openvpn-debian.sh" cd /etc/openvpn/ tar xf openvpn.sh wget -O /etc/openvpn/1194.conf "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/1194.conf" service openvpn restart sysctl -w net.ipv4.ip_forward=1 sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf iptables -t nat -I POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE iptables-save > /etc/iptables_yg_baru_dibikin.conf wget -O /etc/network/if-up.d/iptables "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/iptables" chmod +x /etc/network/if-up.d/iptables service openvpn restart # konfigurasi openvpn cd /etc/openvpn/ wget -O /etc/openvpn/True-Dtac.ovpn "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/client-1194.conf" MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | grep -v '192.168'`; sed -i s/xxxxxxxxx/$MYIP/g /etc/openvpn/True-Dtac.ovpn; cp True-Dtac.ovpn /home/vps/public_html/ # install badvpn cd wget -O /usr/bin/badvpn-udpgw "https://github.com/gmchoke/GMCHOKE1/blob/master/badvpn-udpgw" if [ "$OS" == "x86_64" ]; then wget -O /usr/bin/badvpn-udpgw "https://github.com/gmchoke/GMCHOKE1/blob/master/badvpn-udpgw64" fi sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local chmod +x /usr/bin/badvpn-udpgw screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 # setting port ssh cd sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config service ssh restart # install dropbear apt-get -y install dropbear sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 443 -p 80"/g' /etc/default/dropbear echo "/bin/false" >> /etc/shells echo "/usr/sbin/nologin" >> /etc/shells service ssh restart service dropbear restart # install vnstat gui cd /home/vps/public_html/ wget http://www.sqweek.com/sqweek/files/vnstat_php_frontend-1.5.1.tar.gz tar xf vnstat_php_frontend-1.5.1.tar.gz rm vnstat_php_frontend-1.5.1.tar.gz mv vnstat_php_frontend-1.5.1 vnstat cd vnstat sed -i "s/\$iface_list = array('eth0', 'sixxs');/\$iface_list = array('eth0');/g" config.php sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php sed -i 's/Internal/Internet/g' config.php sed -i '/SixXS IPv6/d' config.php sed -i "s/\$locale = 'en_US.UTF-8';/\$locale = 'en_US.UTF+8';/g" config.php cd # Install Squid apt-get -y install squid3 cp /etc/squid3/squid.conf /etc/squid3/squid.conf.orig wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/squid3.conf" MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | grep -v '192.168'`; sed -i s/xxxxxxxxx/$MYIP/g /etc/squid3/squid.conf; service squid3 restart # install webmin cd #wget -O webmin-current.deb http://prdownloads.sourceforge.net/webadmin/webmin_1.760_all.deb wget -O webmin-current.deb https://github.com/gmchoke/GMCHOKE1/blob/master/webmin-current.deb dpkg -i --force-all webmin-current.deb apt-get -y -f install; #sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf rm -f /root/webmin-current.deb apt-get -y --force-yes -f install libxml-parser-perl service webmin restart service vnstat restart # Install Dos Deflate apt-get -y install dnsutils dsniff wget https://raw.github.com/jgmdev/ddos-deflate/archive/master.zip unzip master.zip cd ddos-deflate-master ./install.sh cd # download script cd /usr/bin wget -O menu "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/menu.sh"
