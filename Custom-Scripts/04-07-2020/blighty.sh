#!/bin/bash 
# Created by GreyNom 
# Purpose: Utility for xbacklight program
# Mostly usless as the command itself of xbacklight its quite complete
#
ans=$1
value=$2
#----
#Filtering  input parts
if [ -z $ans ] ; then 
	echo "Blighty: Enter arguments, --help option available"
	exit
fi

if [ $ans == "?" ] || [ $ans == "--help" ]; then
echo -n ""
else
	if [ -z $value ]; then 
		echo "Blighty: Enter a value next to set/+/- sign!"
		exit
	fi
fi
#---- 

#Input reactive part 
case $ans in 
"-s" | "--set")
xbacklight -set $value
;;
"-")
xbacklight -dec $value
;;
"+")
xbacklight -inc $value
;;
"?")
echo "$(xbacklight -get | cut -c 1-5) intensity"
;;
"--help")
echo '
__________.__  .__       .__     __          
\______   \  | |__| ____ |  |___/  |_ ___.__.
 |    |  _/  | |  |/ ___\|  |  \   __<   |  |
 |    |   \  |_|  / /_/  >   Y  \  |  \___  |
 |______  /____/__\___  /|___|  /__|  / ____|
        \/       /_____/      \/      \/     
------

Usage: 

blighty  [ ? (See value)] [-s | --set] VALUE ] | [ - VALUE ] | [ + VALUE ] 

------ '
;;
*)
echo "Invalid argument, please enter a valid one"
esac
#--- 

#Created 04/07/2020