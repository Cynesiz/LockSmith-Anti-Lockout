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
echo -e "\033[1;33m[!] $1"
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
   read choice
   echo $choice;
 }




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
locksmith ALL=(ALL) !ALL
locksmith ALL=NOPASSWD: /sbin/reboot
locksmith ALL=NOPASSWD: /sbin/iptables
locksmith ALL=NOPASSWD: /sbin/ifconfig
locksmith ALL=NOPASSWD: /sbin/route
# End LockSmith Sudoers Config
EOL




