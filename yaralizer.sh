#!/bin/bash

#Creates a yara rule file with the strings of the input file (one yara string per line)

echo "rule $1rule" >> $1_yaralized.yar
echo "{" >> $1_yaralized.yar
echo -e "\tstrings:"

i=0

while read line
do
	echo -e "\t\t\$st$i = \"$line\"" >> $1_yaralized.yar
 	i=$((i + 1))
done < $1

echo -e "\tcondition:" >> $1_yaralized.yar
echo -e "\t\tall of them" >> $1_yaralized.yar
echo "}" >> $1_yaralized.yar
