#!/bin/bash

#Test all yara rules located inside $yarapath dir and subdirs against current directory files or specific given path

yarapath="/home/th3sp1s/00-utils/yararules/"


if [ "$#" -gt 1 ]  ; then
	echo 
	echo "Error: Illegal number of arguments."
	echo 
	echo "Usage: yarale [path]"
	echo 
	exit 1
fi

if [  "$1" = "-help" ] ||  [  "$1" = "--help" ] ||  [  "$1" = "-h" ] ; then
	echo "Usage: yarale [path]"
	echo
	echo "Take all yara rules located inside dir and subdirs from configured path " 
	echo "and test them against current directory files or specific given path."
	echo
	exit 1
fi


if [ "$#" -eq 1 ]  ; then

	while IFS= read -r -d '' -u 9
	do
	    yara $REPLY  -r $1

	done 9< <( find $yarapath -type f -print0 )
	echo "Tested against $1 all yara rules from $yarapath"
	exit 1
fi

if [ "$#" -eq 0 ]  ; then

	while IFS= read -r -d '' -u 9
	do
	    yara $REPLY  -r .

	done 9< <( find $yarapath -type f -print0 )
	echo "Tested against files in current dir all yara rules from $yarapath"
	exit 1
fi
