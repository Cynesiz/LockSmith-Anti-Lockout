#!/bin/bash
# This file is part of LockSmith.
# This script assumes a Debian/Ubuntu Environment

# Interface Menus
clear
function banner ()
{                                                       
  line                                                       
  e " LockSmith is free software: you can redistribute it and/or modify"
  e " it under the terms of the GNU General Public License as published by"
  e " the Free Software Foundation, either version 3 of the License, or"
  e " (at your option) any later version."
  line
  e " LockSmith is distributed in the hope that it will be useful,"
  e " but WITHOUT ANY WARRANTY; without even the implied warranty of"
  e " MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
  e " GNU General Public License for more details."
  line
  e " You should have received a copy of the GNU General Public License"
  e " along with LockSmith.  If not, see <http://www.gnu.org/licenses/>."
  line
  enter
}
# Pre-set Variables
runuser="locksmith"
depends="echoping curl netcat"
sudoers="/etc/sudoers"
# Prompt for enter
function enter ()
{
  line
  read -sn 1 -p "\033[1;33m[!] Press enter to continue..."
  clear
}
# Attention
function attn ()
{
  printf "%b\n" "\033[1;33m[!] $1"
}
# Title
function title ()
{
  printf "%b\n" "\n\e[40;38;5;82m $1 \e[0m\n"
}
# Confirm Action result=$(confirm "something")
# @param string "Confirmation Message"
# @return bool
function confirm ()
{
   attn $1
   read confirm
   # 0 = true; 1 = false;
   if [[ "$confirm" == "y" ]]; then
     unset -v confirm
     return 0
   else
     unset -v confirm
     return 1
   fi
}
# Choose Action result=$(choose "something")
# @param string "Message for choice"
# @return string "Data entered by user"
function choose ()
{
   attn $1
   read choose
   echo $choose
   unset -v choose
}
# Boundry Line
# @param int "Integer indicating size"
# @return string "Echos the line string"
function line ()
{
 case $1 in
  1 ) printf "%s\n" " - - - - - - - - - - - - - - - - - - - - - - - - - - - - ";;
  2 ) printf "%s\n" "---------------------------------------------------------";;
  3 ) printf "\n%s\n" "=========================================================";;
  * ) printf "\n";;
 esac
}
# printf "%s\n" alias
function e () 
{
  printf "%s\n" $1
}
# Print Main Menu
function menu_main ()
{
   line 2
   printf "%b\n" "\n\e[30;48;5;82m LOCKSMITH \e[40;38;5;82m Setup and Install \e[0m \n"
   e "[1] - (Semi) Automated Setup: Executes Tasks 2-8"
   e "[2] - Program Options and Installation"
   e "[3] - Configure Network Testing"
   e "[4] - Configure File System Testing"
   e "[5] - Configure Lockout Procedures"
   e "[6] - Configure Security and Logging"
   e "[7] - Test Current Configuation"
   e "[8] - Send an anonymous thank you"
   line
   e "[0] - Exit Program."
   line
   e "Enter selection: "
}
# Print Install menu
function menu_install ()
{
   e "[1] - Update Repositories"
   e "[2] - Install Dependencies"
   e "[3] - Define Lockout Levels"
   e "[4] - Add LockSmith User (nologin)"
   e "[5] - Allow Priviledged Commands"
   e "[6] - Install LockSmith"
   e "[7] - Add Crontab Entry"
   e "[8] - Additional Options"    
   line
   e "[0] - Previous Menu."
   line
   e("Enter selection: "
}
# Print Network Menu
function menu_network ()
{
   line 2
   printf "%b\n" "\n\e[40;38;5;82m Network Configuration  \e[0m"
   e "[1] - Network Lockout Levels"
   e "[2] - Builtin Network Tests"
   e "[3] - Custom Network Tests (expert)"
   e "[4] - Set Server for Ingress Testing"
   e "[5] - Open Egress Port for Testing (Important)"
   e "[6] - IPTables Emergency Procedure"
   e "[7] - Network Interface(s) Emergency Procedure"
   e "[8] - Network Route Emergency Procedure"
   line
   e "[0] - Previous Menu."
   line
   choose "Enter selection: "
} 
# File system tests menu
function filesystem_menu ()
{
   line 2
   printf "%b\n" "\n\e[40;38;5;82m File System Configuration  \e[0m"
   e "[1] - FS Lockout Levels"
   e "[2] - FS Builtin Tests"
   e "[3] - FS Custom Tests (expert)"
   e "[4] - FS Lockout Procedures"
   line
   e "[0] - Previous Menu."
   line
   choose "Enter selection: "
}
# Lockout Procedures Menu
function lockout_menu ()
{    
   line 2
   printf "%b\n" "\n\e[40;38;5;82m Lockout Procedures \e[0m"
   e "[1] - Define Lockout Levels"
   e "[2] - Push Notifications"
   e "[3] - IPTables Emergency Procedure"
   e "[4] - Network Interface Emergency Procedure"
   e "[5] - Network Route Emergency Procedure"
   e "[6] - Daemon Restart Procedure"
   e "[7] - System Reboot Procedure"
   e "[8] - Reverse Connect Procedure"
   e "[9] - Last Resort Procedure"
   e "[10] - Custom Procedures (expert)"
   line
   e "[0] - Previous Menu."
   line
   choose "Enter selection: "
}
# Security and Logging Menu
function security_menu()
{
 # Add hash checking
 # Add logging
}



# Begin Program
banner
selection=
 until [ "$selection" = "0" ]; do
   print_menu
   read selection
   line
   case $selection in
   1 ) autoinstall;;
   2 ) apt-get update;;
   3 ) apt-get install ${depends} -y;;
   4 ) 
   5 ) 
   6 ) 
   7 ) 
   8 ) 
   9 ) 
   10 ) 
   0 ) exit;;
   * ) clear;menu_main;;
   esac
 done

function sudoconfig ()
{
   # Add a restricted user for LockSmith 
   adduser -s /sbin/nologin -m -d /dev/null -c "LockSmith Anti-Lockout" locksmith

   # Backup Sudoers File
   cp /etc/sudoers /etc/sudoers.bak

   # Allow locksmith access to privileged commands
   # Writes to sudoers file
   cat >>${sudoers} <<<EOL
# LockSmith Anti-Lockout Privileged Commands
# User alias specification
User_Alias      LOCKSMITH = ${runuser}
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
#Cmnd_Alias      CMD_ = 
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
}



