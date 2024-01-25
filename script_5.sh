#Jack Robbins
#Homework 1, problem 5

#!bin/bash

NEWLINE=$'\n'

#get the user provided directory
dir=$1

#may as well check if directory exists before continuing
if [ ! -d $dir ]; then
    echo "Invalid entry, no directory named ${dir}, program will now exit"
fi


for file in ${dir}/*; do
    fl=$(basename "${file}")

    echo "Checking if file: ${fl} has any duplicates"

    #strip file down to basename for search
    amount=$(find ${dir}/ -iname $fl | wc -l)

    #If there is a duplicate, show the user
    if [ $amount -gt 1 ]; then
        echo "**Duplicates found**${NEWLINE}"
        #display for user
        find ${dir}/ -iname $fl
        read -p "Would you like to delete the duplicate file[yes/no]: " confirm

    fi
done



