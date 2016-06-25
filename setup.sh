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
# @param string "Confirmation Message"
# @return bool
function confirm ()
{
   attn($1)
   read confirm
   # 0 = true; 1 = false;
   if [[ "$confirm" == "y" ]]; then
     unset -v confirm
     echo 0
   else
     unset -v confirm
     echo 1
   fi
}
# Choose Action result=$(choose(something))
# @param string "Message for choice"
# @return string "Data entered by user"
function choose ()
{
   attn($1)
   read choose
   echo $choose;
   unset -v choose
}
# Boundry Line
# @param int "Integer indicating size"
# @return string "Echos the line string"
function line ()
{
 case $1 in
  1 ) echo -e " - - - - - - - - - - - - - - - - - - - - - - - - - - - - ";;
  2 ) echo -e "---------------------------------------------------------";;
  3 ) echo -e "\n=========================================================\n";;
  * ) echo -e "\n";;
 esac
}
# printf "%s\n" alias
function e () {
  printf "%s\n" $1
}
# Print Main Menu
function menu_main ()
{
   line(2)
   printf "%b\n" "\n\e[30;48;5;82m LOCKSMITH \e[40;38;5;82m Setup and Install \e[0m \n"
   e("[1] - Semi-Automated Setup: Executes Tasks 2-7"
   echo "[2] - Program Options and Installation"
   echo "[3] - Configure Network Testing"
   echo "[4] - Configure File System Testing"
   echo "[5] - Configure Lockout Procedures"
   echo "[6] - Configure Security Options"
   echo "[7] - Run Configuration Tests"
   echo "[8] - Send an anonymous thank you"
   line()
   echo "[0] - Exit Program."
   line()
   echo "Enter selection: "
}

   echo -e "\n\e[40;38;5;82m File System Testing  \e[0m \n"
    
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
   echo "Enter selection: "
}
# Print Install menu
function menu_install ()
{
   e("[1] - Update Repositories")
   e("[2] - Install Dependencies")
   e("[3] - Define Lockout Levels")
   e("[4] - Add LockSmith User (nologin)"
   e("[5] - Allow Priviledged Commands")
   e("[6] - Install LockSmith")
   e("[7] - Add Crontab Entry")
   e("[8] - Additional Options")    
   line()
   e("[0] - Previous Menu.")
   line()
   e("Enter selection: ")
}
# Print Network Menu
function menu_network ()
{
   echo ""
   echo -e "\n\e[40;38;5;82m Network Testing  \e[0m \n"
   echo "[1] - Confirgure Network Tests"
   echo "[2] - Choose Server for Ingress testing"
   echo "[3] - Open Egress Port for Network Testing"
   echo ""
   echo "[0] - Previous Menu."
   echo ""
   "Enter selection: "
}   

function lockout_menu ()
{
   echo -e "\n\e[40;38;5;82m Lockout Procedures \e[0m \n"
   echo "[1] - Setup Push Notifications"
   echo "[2] - Setup IPTables Emergency Procedure"
   echo "[3] - Setup Network Interface Emergency Procedure"
   echo "[4] - Setup Daemon Restart Procedure(s)"
   echo "[5] - Setup System Reboot Procedure"
   echo "[6] - Setup Reverse Connect Procedure"
   echo "[7] - Setup Custom Procedure(s)"
   echo "[8] - Setup Last Resort Procedures"
   echo ""
   echo "[0] - Previous Menu."
   echo ""
   "Enter selection: "
}

# green bg/black fg \e[30;48;5;82m






























banner

selection=
 until [ "$selection" = "0" ]; do
   print_menu
   read selection
   echo ""
   case $selection in

   1 ) apt update -y;;
   2 ) apt install ${depends};;
   3 ) 
   4 ) 
   5 ) 
   6 ) 
   7 ) 
   8 ) 
   9 ) 
   10 ) 
   11 ) 
   12 ) 
   13 ) 
   14 ) 
   15 ) 
   16 ) 
   17 ) 
   18 ) 
   19 ) 
   0 ) 
   * ) 
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




 
function sudoconfig ()
{
   # Add a restricted user for LockSmith 
   adduser -s /sbin/nologin -m -d /dev/null -c "LockSmith Anti-Lockout" locksmith

   # Backup Sudoers File
   cp /etc/sudoers /etc/sudoers.bak

   # Allow the user to access the required commands with sudo
   cat >>/etc/sudoers <<<EOL
# LockSmith Anti-Lockout Privileged Commands
# User alias specification
User_Alias      LOCKSMITH = locksmith
# Command alias specification
Cmnd_Alias      CMD_REBOOT = /sbin/reboot
Cmnd_Alias      CMD_IPTABLES = /sbin/iptables
Cmnd_Alias      CMD_IFCONFIG = /sbin/ifconfig
Cmnd_Alias      CMD_ROUTE = /sbin/route
Cmnd_Alias      CMD_SERVICE = /usr/sbin/service
Cmnd_Alias      CMD_KILL = /bin/kill 
Cmnd_Alias      CMD_KILLALL = /usr/bin/killall
Cmnd_Alias      CMD_MOUNT = /bin/mount
Cmnd_Alias      CMD_UMOUNT = /bin/umount
Cmnd_Alias      CMD_FSCK = /sbin/fsck
Cmnd_Alias      CMD_ = 
#Cmnd_Alias      CMD_ = 
# User privilege specification
LOCKSMITH ALL=(ALL) !ALL
LOCKSMITH ALL=NOPASSWD: CMD_REBOOT
LOCKSMITH ALL=NOPASSWD: CMD_IPTABLES
LOCKSMITH ALL=NOPASSWD: CMD_IFCONFIG
LOCKSMITH ALL=NOPASSWD: CMD_ROUTE
LOCKSMITH ALL=NOPASSWD: CMD_SERVICE
LOCKSMITH ALL=NOPASSWD: CMD_KILL
LOCKSMITH ALL=NOPASSWD: CMD_KILLALL
#LOCKSMITH ALL=NOPASSWD: CMD_
# End LockSmith Sudoers Config
EOL




