#!/bin/bash

if [[ -z "$1" || -z "$2" ]] 
then
	exit 1 
fi

file_path=${1%/*} 

if [[ ! -e $file_path ]]
then
	mkdir -p $file_path
fi

echo $2 > $1

