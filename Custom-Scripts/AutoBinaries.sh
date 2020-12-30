#!/bin/bash

#Variables

binary_folder="Binaries"
ls > .autoBinaries_dump 
rawcounter=$( wc -l .autoBinaries_dump | cut -d' ' -f1)

#Banner
echo '   _____          __        __________.__                    .__               
  /  _  \  __ ___/  |_  ____\______   \__| ____ _____ _______|__| ____   ______
 /  /_\  \|  |  \   __\/  _ \|    |  _/  |/    \\__  \\_  __ \  |/ __ \ /  ___/
/    |    \  |  /|  | (  <_> )    |   \  |   |  \/ __ \|  | \/  \  ___/ \___ \ 
\____|__  /____/ |__|  \____/|______  /__|___|  (____  /__|  |__|\___  >____  >
        \/                          \/        \/     \/              \/     \/ '


#Checks valid folder of binaries
if [ ! -d ../$binary_folder ]; then echo "\"$binary_folder\" is not a valid one" ; exit ; fi

#Functions
main_flow () {
	rm ../$binary_folder/* 2> /dev/null && echo "Deleting Binaries files"
	i=0 
while [ $i != $rawcounter ] ; 
do 
		i=$(($i+1))
		file=$(cat .autoBinaries_dump | cut -d$'\n' -f$i)
		command=$(echo -n "shc -f $file -o $file" && echo "_bin")
		if [ ! -d $file ] && [ $file != "AutoBinaries.sh" ];
		then 
			    echo "-------------"
			    echo "Creating Binary of $file"
	    		$command
    			echo "Completed"
    			echo "Moving $file to ../$binary_folder directory"
    			mv $(echo -n "$file" && echo "_bin") ../$binary_folder/$file	
		fi
	done

	echo -e "-------------\nRemoving .x.c odd files"
	rm *.x.c .autoBinaries_dump
	echo -e "\nCompiling completed"
}

trigger_migration () {
	echo "Migrating to /bin all Binaries files"
	sudo cp ../$binary_folder/* /bin && echo "All binaries migrated" || echo "Migration cancelled"
	exit
}
#Argument checker
case $1 in

 $(test -z))
	echo "!! -- Not argument detected, only converting to binary"
	main_flow
 ;;
 "--migrate")
	main_flow
	trigger_migration
 ;;
"--just")
	if [ ! -f $2 ] || [ -z $2 ]; then echo "An error occured, enter a valid namefile" ; exit; fi
	echo "Single file mode"
	command=$(echo -n "sudo shc -f $2 -o /bin/$2")
	 echo "-------------"
	 echo "Creating Binary $1 and migrating" && $command && echo "Completed"
     rm -f $2.x.c .autoBinaries_dump
	exit
;;
"--just-migrate")
	echo "Migrating without compiling..."
	i=0 
	while [ $i != $rawcounter ] ; 
	do 
			i=$(($i+1))
			file=$(cat .autoBinaries_dump | cut -d$'\n' -f$i)
			if [ ! -d $file ] && [ $file != "AutoBinaries.sh" ];
			then 
				    echo "-------------"
    				echo "Moving $file to ../bin directory"
    				sudo cp $file /bin/$file && echo "Completed"
			fi
	done
	rm .autoBinaries_dump
	echo -e "-------\nCompleted migration"
	exit
;;
 "--help")
echo '#DOCUMENTATION 
# Made by Gugeldot23
# The motivation of this script is to avoid repetitive compiling by shc of your scripts. 
# It automates it with all the files available in the directory executed 
# BE CAREFULL, BINARIES IN THE BINARY FORLDER WILL BE DELETED EVERY TIME THE SCRIPT IS 
# EXECUTED TO AVOID REPETITION
# DISCLAIMER: 
#	This script is concieved to be executed at this following location
#	The only compulsory thing is to have a directory called Binaries a level above where 
#   the script its executed
#   You can rename the folder if you want by replacing "Binaries" in variable binary_folder
# Represetnation of the script: 
# ├── Binaries --> Where they will be placed.
# │   
# ├── Except--> Binaries you dont want to be deleted or Scripts you dont want to convert    
# │   
# └── Script Folder --> No matter the name
#     ├── AutoBinaries.sh --> The script itself has to be placed at the directory 
#							  of your scripts
#     └── YourScripts...
#
# MIGRATION OPTION ADDED: 
# Use --migrate argument to move Binaries files to /bin
# 
# SINGLE FILE MIGRATION OPTION ADDED: 
# Use --just argument and the name of the file to move Binaries files to /bin
# THANKS FOR USING IT!!
#
# MIGRATiON OPTION WITHOUT COMPILING: 
# Use --just-migrate argument to move Binaries files to /bin'
exit
;;

*)
echo -e "Sorry try a valid argument or a valid file name \n--help available."
exit
;;
esac

