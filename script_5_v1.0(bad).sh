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
    #Could be a directory, make sure its a file, if it isn't then continue
    [[ -f "$file" ]] || continue

    #Strip to basename
    fl=$(basename "${file}")

    #declare an array to hold duplicates
    declare -a dupeArray=()

    #populate the array
    while read f; do
        dupeArr+=("$f")
    done < <(find ${dir}/ -iname "$fl")

    #if there is more than one element, we found duplicates
    if [[ ${#dupeArr[@]} -gt 1 ]]; then
        echo "**Duplicates found**${NEWLINE}"
        #display for user
        find ${dir}/ -iname "$fl"
        echo "${NEWLINE}"

        #prompt user for deletion
        read -p "Would you like to delete duplicate files[yes/no]: " confirm

        #if yes, delete everything that isn't index 0 in the array
        if [[ "$confirm" == "yes" ]]; then
            #delete everything past index 1
            for (( i=1; i<${#dupeArr[@]}; i++ )); do
               rm "${dupeArr[$i]}"
            done
            echo "All duplicates of ${fl} have been deleted${NEWLINE}"
        fi
    fi

    #wipe array every iteration
    dupeArr=()
done

echo "No additional duplicate files found${NEWLINE}"
