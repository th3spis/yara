#!/bin/bash

#Creates a yara rule file with the strings of the input file (one yara string per line)

#get the input name until it finds a "."
filename="${1//.*}_yaralized.yar"

echo "rule ${1//.*}rule" > $filename
echo "{" >> $filename
echo -e "\tstrings:" >> $filename

i=0

while read line
do
	echo -e "\t\t\$st$i = \"$line\" ascii wide" >> $filename
 	i=$((i + 1))
done < $1

echo -e "\tcondition:" >> $filename
echo -e "\t\tall of them" >> $filename
echo "}" >> $filename

echo "Successfully created $filename"
