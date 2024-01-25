#Jack Robbins
#Homework 1, problem 5

#!bin/bash

#get the user provided directory
dir=$1

#may as well check if directory exists before continuing
if [ ! -d $dir ]; then
    echo "Invalid entry, no directory named ${dir}, program will now exit"
fi


for file in ${dir}/*; do
    fl=$(basename "$file")
    echo "looking for ${fl}"
    find ${dir}/ -iname $fl
    if [ $($search | wc -l) -gt 1 ]; then
        echo "here"
    fi
done



