# Jack Robbins
# Homework 1, Problem 5

#!bin/bash

NEWLINE=$'\n'

#Check if user provided directroy is a directory
if [ ! -d "$1" ]; then
    echo "Invalid entry, no directory named ${dir}, program will now exit"
fi

#declare an array to hold all of the files we have already found
declare -a seen=()

#The dfs function performs a depth first tree search on the directory given
function dfs() {
    #if it is not a directory, or is empty, no point in traversing
    if [[ ! -d "$1" ]] || [[ $(ls "$1" -1 | wc -l) -eq 0 ]]; then
        return
    fi

    #local variables to store the entries as an array, and the local variable entry
    local entries=("$1"/*)
    local entry

    #traverse each entry and process accordingly
    for entry in "${entries[@]}"; do
        #by default, assume we have never seen this file name before
        notFound=true
        #get basename for convenience
        fl=$(basename "${entry}")
        
        #go through the array of previously seen entries, looking for the current entry
        for en in "${seen[@]}"; do
           #get basename for convenience
           base=$(basename "${en}")

           #if the entry is a file, and the two basenames match
           if [[ -f "${entry}" ]] && [[ "${fl}" == "${base}" ]]; then
                #set flag to false
                notFound=false

                #Notify user, print out the files
                echo "****Duplicates found****${NEWLINE}"
                echo "$entry"
                echo "$en"

                #Prompt user for deletion
                read -p "${NEWLINE}Would you like to delete duplicate files[yes/no]: " answer
                #Once user confirms deletion, perform deletion
                if [[ "$answer" == "yes" ]]; then
                    echo "Deleting duplicate file: ${entry}"
                    rm "${entry}"
                fi
            fi
        done
        
        #if we didn't find any duplicates, its a new file, so add it into seen array
        if [[ "${notFound}" = true ]] && [[ -f "$entry" ]]; then
            seen+=("$entry")
        fi

        #After we've done all of this, recursively call dfs on each entry
        dfs "$entry"
    done
}

dfs "$1"
