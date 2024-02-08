# Jack Robbins
# Homework 1, Problem 5

#!bin/bash

#get the user provided directory
dir="$1"

if [ ! -d $dir ]; then
    echo "Invalid entry, no directory named ${dir}, program will now exit"
fi

#declare an array to hold all of the files we have already found
declare -a seen=()

function dfs() {
    #if it is not a directory, or is empty, return
    if [[ ! -d "$1" ]] || [[ $(ls "$1" -1 | wc -l) -eq 0 ]]; then
        return
    fi

    local entries=("$1"/*)
    local entry

    for entry in "${entries[@]}"; do
        echo "$entry"
        dfs "$entry"
    done
}

dfs "$1"
