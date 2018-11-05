#!/bin/bash
#source $HOME/.bashrc
NEWIP=$( curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//') 
OLDIP=$(cat /home/pi/ip.txt)
if [ -z "$NEWIP" ]; then
	exit
fi
if [ "$NEWIP" != "$OLDIP" ]; then
	#echo "true"
	echo "$NEWIP" > /home/pi/ip.txt
	mutt -s "IP" **********@vtext.com < /home/pi/ip.txt
fi



