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
" > /home/vps/public_html/index.html wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/vps.conf"
