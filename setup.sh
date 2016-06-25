#!/bin/bash
# This file is part of LockSmith.
# This script assumes a Debian/Ubuntu Environment

# Interface Menus
clear
function banner ()
{
  echo ""
  echo -e "    _                _     _____           _ _   _     "
  echo -e "   | |              | |   / ____|         (_) | | |    "
  echo -e "   | |     ___   ___| | _| (___  _ __ ___  _| |_| |__  "
  echo -e "   | |    / _ \ / __| |/ /\___ \| '_ ` _ \| | __| '_ \ "
  echo -e "   | |___| (_) | (__|   < ____) | | | | | | | |_| | | |"
  echo -e "   |______\___/ \___|_|\_\_____/|_| |_| |_|_|\__|_| |_|"
  echo -e "                                                       "
  echo ""                                                       
  echo -e " LockSmith is free software: you can redistribute it and/or modify"
  echo -e " it under the terms of the GNU General Public License as published by"
  echo -e " the Free Software Foundation, either version 3 of the License, or"
  echo -e " (at your option) any later version."
  echo ""
  echo -e " LockSmith is distributed in the hope that it will be useful,"
  echo -e " but WITHOUT ANY WARRANTY; without even the implied warranty of"
  echo -e " MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
  echo -e " GNU General Public License for more details."
  echo ""
  echo -e " You should have received a copy of the GNU General Public License"
  echo -e " along with LockSmith.  If not, see <http://www.gnu.org/licenses/>."
  echo ""
  enter
}
# Prompt for enter
function enter ()
{
  echo ""
  read -sn 1 -p "\033[1;33m[!] Press any key to continue..."
  clear
}
# Attention
function attn ()
{
  echo -e -n "\033[1;33m[!] $1"
}
# Title
function title ()
{
  echo -e "\n\e[40;38;5;82m $1 \e[0m\n"
}
# Confirm Action result=$(confirm(something))
function confirm ()
{
   attn($1)
   read confirm
   echo $confirm;
}
# Choose Action result=$(choose(something))
function choose ()
{
   attn($1)
   read choose
   echo $choose;
}
# Print Setup Menu
function print_menu ()
{
   echo ""
   echo -e "\n\e[40;38;5;82m Primary Tasks \e[0m \n"
   echo "[1] - Semi-Automated Setup: Executes Tasks 2-20"
   echo "[2] - Update Repositories"
   echo "[3] - Install Dependencies"
   echo "[4] - Add LockSmith User (nologin)"
   echo "[5] - Add Configuration for Priveledged Commands to ${sudoers}"
   echo "[6] - Install LockSmith Scripts"
   echo "[7] - Add Crontab Entry"
   echo "[8] - Define Lockout Levels"
   echo -e "\n\e[40;38;5;82m Network Testing \e[30;48;5;82m WEB SERVER \e[0m \n"
   echo "[9] - Choose Network Tests, Ports and Associated Levels"
   echo "[10] - Choose Server for Ingress testing"
   echo "[11] - Open Egress Port for Network Testing"
   echo -e "\n\e[40;38;5;82m Lockout Procedures \e[0m \n"
   echo "[12] - Setup Push Notifications"
   echo "[13] - Setup IPTables Emergency Procedure"
   echo "[14] - Setup Network Interface Emergency Procedure"
   echo "[15] - Setup Daemon Restart Procedure(s)"
   echo "[16] - Setup System Reboot Procedure"
   echo "[17] - Setup Reverse Connect Procedure"
   echo "[18] - Setup Custom Procedure(s)"
   echo "[19] - Setup Last Resort Procedures"
   echo ""
   echo "[20] - Let us know you found this useful (anonymous)"
   echo ""
   echo "[0] - exit program."
   echo ""
   "Enter selection: "
}
































banner

selection=
 until [ "$selection" = "0" ]; do
   print_menu
   read selection
   echo ""
   case $selection in

   1 ) apt update -y;;
   2 ) apt install ${depends};;
   3 ) apt install php5-cgi php5 php5-cli php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-xcache apache2-utils php5-fpm -y;enter;;
   4 ) apt install python-software-properties -y;mariadb;clear;;
   5 ) mariadb_secure;enter;clear ;;
   6 ) down; dpkg -i hiawatha_*.deb; rm hiawatha_*;enter ;;
   7 ) dpkg-reconfigure tzdata; enter; echo "We are done.It was cool? NO :)";enter ;;
   8 ) echo -e $info;sleep 3;cp $config $config\.backup;x=( 57 58 59 60 61 );for i in "${x[@]}";do sed -i "${i}s/^#//" $config;done;sed -i s'/\#CGIhandler\ =\ \/usr\/bin\/php\-cgi\:php/CGIhandler\ = \/usr\/bin\/php\-cgi\:php/' $config;sed -i s#"$connect1"#"$connect2"#g $config;service php5-fpm restart; enter ;;
   9 ) echo -e -n "\n$up Set site/vhost remove number(example 1-10): ";read number; echo -e -n "\n$up Enter domain name or your server IP: ";read domain;echo -e -n "\n$up Enter site folder (example /var/www/hiawatha): ";read root;echo -e -n "\n$up Enter site default page (index.php or index.html): ";read index;echo -e "\n#${number}\nVirtualHost {\n\tHostname = ${domain} \n\tWebsiteRoot = ${root}\n\tStartFile = ${index} #Use index.php or index.html\n\t#AccessLogfile = ${root}/access.log\n\t#ErrorLogfile = ${root}/error.log\n\tTimeForCGI = 20\n\tUseFastCGI = PHP5\n}" >> $config;enter ;;
   10 ) wordpress_vhost;wordpress;set_mysql;echo "";restart;echo "";service php5-fpm restart;echo -e "\e[31m\n$up Open your browser with your domain or ip and start wordpress installation.\nIf something goes wrong check your settings (/etc/hiawatha/hiawatha.conf)\e[0m";sleep 3;yes_no ;;
   11 ) echo -e -n "\n$up Enter site/vhost remove number: " ;read n; for i in "${n[@]}";do sed -i "/#${n}/,/} /d" $config;done;sed -i '$d' $config;enter ;;
   12 ) phpmyadmin;admin_hiawatha;where_phpmyadmin; ;;
   13 ) apt remove phpmyadmin;rem=$(find / -type d -name phpmyadmin); rm -rf $rem;enter;;
   14 ) rem_wordpress;enter ;;
   15 ) echo -e "\n$up\e[31m If you want to protect directory from public access use this option\e[0m";protect ;;
   16 ) protect_remove ;;
   17 ) x=( 40 41 42 43 44 );for i in "${x[@]}";do sed -i "${i}s/^#//" $config;done; clear;;
   18 ) fail2; enter ;;
   19 ) fail2_remove;clear ;;
   0 ) exit ;;
   * ) echo -e "$up Please enter 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, ,13, 14, 15, 16, 17, 18, 19 or 0"
   esac
 done




# Pre-set Variables
runuser="locksmith"
depends=""
sudoers="/etc/sudoers"




# Update Package Repository
apt-get update

# Install Required Packages
apt-get install 




 

# Add a restricted user for LockSmith 
adduser -s /sbin/nologin -m -d /dev/null -c "LockSmith Anti-Lockout" locksmith

# Backup Sudoers File
sudo cp /etc/sudoers /etc/sudoers.bak

# Allow the user to access the required commands with sudo
cat >>/etc/sudoers <<<EOL
# LockSmith Anti-Lockout Privileged Commands
# User alias specification
User_Alias      LOCKSMITH = locksmith
# Cmnd alias specification
Cmnd_Alias      CMD_REBOOT = /sbin/reboot
Cmnd_Alias      CMD_IPTABLES = /sbin/iptables
Cmnd_Alias      CMD_IFCONFIG = /sbin/ifconfig
Cmnd_Alias      CMD_ROUTE = /sbin/route
Cmnd_Alias      CMD_ = 
Cmnd_Alias      CMD_ = 


locksmith ALL=(ALL) !ALL
locksmith ALL=NOPASSWD: 
locksmith ALL=NOPASSWD: 
locksmith ALL=NOPASSWD: 
locksmith ALL=NOPASSWD: 
# End LockSmith Sudoers Config
EOL




