#!/bin/bash
# Created by GrayNom
# Purpose; A fast one line command alternative to previous WilfiManager 
# Cons: Doesnt have the option to change interface which depending on the user may or may not 
# 		Be important. It's available in Wilfi Manager
# 
# TIP: Type in terminal 'sudo ls' and type the passwd, later when executing the command sudo it and it won't have to check for root permission
# 
# I hope you find it interesting!
# VARIABLES
GN='\033[0;32m'
NC='\033[0m'
WH='\033[1;37m'
BK='\033[ 0;30m'
RD='\033[0;31m'           
OR='\033[0;33m'       
YL='\033[1;33m'
BL='\033[0;34m'     
PR='\033[0;35m'     
LBL='\033[0;36m' 
ans=$1 
ssid=$2
passwd=$3
interface=wlan0 #By defualt
wifi_state=$(nmcli dev status 2> /dev/null | grep $interface | cut -d' ' -f10)
wifi_con_to=$(nmcli dev status 2> /dev/null | grep $interface | cut -d' ' -f12)

#Modules---
filtering_input () {
if [ -z $ans ] ; then 
	echo "WiiTurbo: Enter arguments, -help option available"
	exit
fi

if [ $ans == "-connect" ]; then 
	if [ -z $ssid ];then 
		echo "SSID not available please enter ssid" && echo "See -help for help"
		exit		
	fi
	if [ -z $passwd ];then 
		echo "password not available please enter ssid" && echo "See -help for help"
		exit
	fi
fi

if [ $ans == "-disconnect" ]; then 
	if [ -z $ssid ];then 
		echo "SSID not available please enter ssid" && echo "See -help for help"
		exit		
	fi
fi
} ; filtering_input
sudol () {
	echo -ne "${YL}--Enter sudo password for better experience ${NC}\t" && sudo echo -e ""
} 
#---------

case $ans in
"-connect")
sudol
nmcli dev wifi connect $ssid password $passwd && echo "WiiTurbo: connected correctly"
;;
"-disconnect")
sudol
nmcli connection down $ssid  && echo "WiiTurbo: disconnected correctly"
;;
"-scan") 
sudol
 echo -e "${YL}Press q when finished listing${NC} " && nmcli dev wifi list
;;
"-status")
echo -e "Connected to: ${YL}$wifi_con_to${NC} | State: ${YL}$wifi_state${NC}"
;;
"-on")
sudol
sudo systemctl start NetworkManager.service && echo "WiiTurbo: turned on correctly"
;;
"-off")
sudol
systemctl stop NetworkManager.service && echo "WiiTurbo: turned off correctly"
;;
"-restart")
sudol
sudo systemctl restart NetworkManager.service && echo "WiiTurbo: Restarted correctly"
;;
"-help")
echo '
 __      __ ______________           ___           
/  \    /  \__|__\__   ___/_ ________\_ |__   ____  
\   \/\/   /  |  | |   | |  |  \_  __ \ __ \ /  _ \ 
 \        /|  |  | |   | |  |  /|  | \/ \_\ (  <_> )
  \__/\  / |__|__| |___| |____/ |__|  |___  /\____/ 
       \/                                  \/        
-----------------------------------------------------

Usage: 

wiiTurbo [ -scan | -status | -on | -off | -restart ] [-connect | -disconnect SSID [PASSWD]]
'
;;
*)
echo "Invalid argument"
esac 

#Created 03/07/2020