#!/bin/bash

if [[ -z "$1" || -z "$2" ]] 
then
	echo "usage finder.sh directory search_string"
	exit 1 
fi

if [[ ! -d $1 ]]
then
	echo "$1 is not a directory!"
	return 1
fi

declare -i word_count
declare -i file_count

word_count=0
file_count=0


pushd `pwd` > /dev/null
cd $1

for file in `ls -R1`; do
	if [[ -f $file ]]
	then
		file_count+=1
		while read -r line; do
			if [[ $line == *$2* ]]
			then
				word_count+=1
			fi
		done < $file
	fi
done

popd > /dev/null

echo "The number of files are $file_count and the number of matching lines are $word_count"

exit



