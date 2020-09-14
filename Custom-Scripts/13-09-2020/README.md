██████╗  █████╗ ███████╗██████╗ ██████╗ ███████╗██████╗ ██████╗ ██╗   ██╗██████╗ ██╗ ██████╗ ██╗    ██╗
██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝██╔══██╗██║██╔═████╗██║    ██║
██████╔╝███████║███████╗██████╔╝██████╔╝█████╗  ██████╔╝██████╔╝ ╚████╔╝ ██████╔╝██║██║██╔██║██║ █╗ ██║
██╔══██╗██╔══██║╚════██║██╔═══╝ ██╔══██╗██╔══╝  ██╔══██╗██╔══██╗  ╚██╔╝  ██╔═══╝ ██║████╔╝██║██║███╗██║
██║  ██║██║  ██║███████║██║     ██████╔╝███████╗██║  ██║██║  ██║   ██║   ██║     ██║╚██████╔╝╚███╔███╔╝
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝ ╚═════╝  ╚══╝╚══╝ 
                                                                                                       

Hi guys, some ago I got a raspberry pi 0W, It's quite interesting, It really helped me to learn more Shell
Scripting and some fun projects such as a radio. 
The only thing that bothered me was the fact of changing WiFi connections, 
(Have in mind I installed Raspibian Lite (CLI based)) and the simplest way I got for 
changing it was directly editing the wpa supplicant config file. I mean, It's fine I'ts just
changing some fields but in such a portable PC I found it one of the weakest spots. 

So I decided to make my own shell script to manipulate the file by itself and to store 
frequent connections I tend to swap in the week. 

The idea was to store each connections as profiles in a hidden file and select that by CLI input. 
Then I decided to make it slimmer and try something new, the profiles will be written 
at the main code itself and profiles will be stored as hash tables/dictionaries. 

So I did It, it was very interesting and I got my first stackoverflow post because I got 
an bad substitution error which finally got solved. 
That's the link: 
https://stackoverflow.com/questions/63870948/bash-problem-regarding-hash-table-dictionary-and-bad-substitution

I leave the script here so you can test it itself, mind to execute with sudo as wpa_supplicant.conf is protected. 

I hope you find it useful or at least inspire you to make a better one. 

Have a good day!