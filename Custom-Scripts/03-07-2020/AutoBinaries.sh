#!/bin/bash

#DOCUMENTATION 
# Made by GreyNom
# The motivation of this script is to avoid repetitive compiling by shc of your scripts. 
# It automates it with all the files available in the directory executed 
# BE CAREFULL, BINARIES WILL BE DELETED EVERY TIME THE SCRIPT IS EXECUTED TO AVOID REPETITION
# DISCLAIMER: 
#	this script is concieved to be executed at this following location
#	The only compulsory thing is to have a directory called Binaries a level above where the script its executed
#   You can rename the folder if you want by replacing "Binaries" in lines 24,48 and 59
# . Represetnation: 
# ├── Binaries --> Where they will be placed 
# │   
# ├── Except--> Binaries you dont want to be deleted or Scripts you dont want to convert    
# │   
# └── Script Folder --> No matter the name
#     ├── AutoBinaries.sh --> The script itself has to be placed at the directory of your scripts
#     └── YourScripts...
#
# THANKS FOR USING IT!! 

ls > .autoBinaries_dump 
rawcounter=$( wc -l .autoBinaries_dump | cut -d' ' -f1)

echo '   _____          __        __________.__                    .__               
  /  _  \  __ ___/  |_  ____\______   \__| ____ _____ _______|__| ____   ______
 /  /_\  \|  |  \   __\/  _ \|    |  _/  |/    \\__  \\_  __ \  |/ __ \ /  ___/
/    |    \  |  /|  | (  <_> )    |   \  |   |  \/ __ \|  | \/  \  ___/ \___ \ 
\____|__  /____/ |__|  \____/|______  /__|___|  (____  /__|  |__|\___  >____  >
        \/                          \/        \/     \/              \/     \/ '
echo "Deleting Binaries files"
rm ../Binaries/*

i=0 
while [ $i != $rawcounter ]; 
do 
	i=$(($i+1))
	var=$(echo "$(cat .autoBinaries_dump | cut -d$'\n' -f$i)")
	cmd_ex=$(echo -n "shc -f $var -o $var" && echo "_bin")
	if [ ! -d $var ]
	then 
		    echo "-------------"
		    echo "Creating Binary of $var"
    		$cmd_ex
    		echo "Completed"
    		echo "Moving $var to ../Binaries directory"
    		mv $(echo -n "$var" && echo "_bin") ../Binaries/
	else
	 echo -n ""	
	fi
done

echo "-------------"
echo "Removing .x.c odd files"
rm *.x.c
rm .autoBinaries_dump
rm ../Binaries/AutoBinaries*
echo "" && echo "Compiling completed"

