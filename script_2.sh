#Jack Robbins
#Homework assignment 1, problem 2

#!bin/bash

#get the directory provided as a command line argument
dir=$1

if [[ ! -d $dir ]]; then
    echo "Invalid entry, no directory ${dir} found. Program will now exit."
    exit 0
fi

#Make an array to hold all entries(directories and file names)
declare -a entries=()

#get all of the entries, put them in an array
while read e; do
    entries+=("$e")
done < <(ls -1 $dir)

