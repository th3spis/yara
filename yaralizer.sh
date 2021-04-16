#!/bin/bash

#Creates a yara rule file with the strings of the input file (one yara string per line)

#get the input name until it finds a "."
filename="${1//.*}_yaralized.yar"

#remove all empty lines or only-white-spaces lines
sed -i '/^[[:space:]]*$/d' $1


echo "rule ${1//.*}rule" > $filename
echo "{" >> $filename
echo -e "\tstrings:" >> $filename

i=0

#reads from input file because <$1
while read line
do
	echo -e "\t\t\$st$i = \"$line\" ascii wide" >> $filename
 	i=$((i + 1))
done < $1

echo -e "\tcondition:" >> $filename


if [ "$2" = "-any" ] ; then
	echo -e "\t\tany of them" >> $filename

else 
	echo -e "\t\tall of them" >> $filename
fi

echo "}" >> $filename

echo "Created file $filename"
