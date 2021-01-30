#!/bin/bash

filename="${1//.*}_yaralized.yar"
echo $filename

echo "rule $1rule" > $filename
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
