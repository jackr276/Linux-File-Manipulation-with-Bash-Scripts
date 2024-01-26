#Jack Robbins
#Homework assignment 1, problem 2

#!bin/bash

#get the directory provided as a command line argument
dir=$1

if [[ ! -d $dir ]]; then
    echo "Invalid entry, no directory ${dir} found. Program will now exit."
    exit 0
fi





