#Jack Robbins
#Homework assignment 1, problem 2

#!bin/bash

NEWLINE=$'\n'

#If the entry is invalid, exit script
if [[ ! -d "$1" ]]; then
    echo "Invalid entry, no directory ${dir} found. Program will now exit."
    exit 0
fi

#get all of the entries, put them in an array
entries=("$1"/*)

#Use an insertion sort algorithm to sort the items in descending order
function reverse(){
   #get array as function argument
   local -n array=$1

   #get size of array
   size=${#array[@]}
   #insertion sort but backwards
   for (( i=1; i < $size; i++ )); do
       #get the element as a key
       key="${array[i]}"

       #declare j
       j=$(($i-1))

       #while array at j more than key, swap
       while [[ $j -ge 0 ]] && [[ "${array[j]}" < "$key" ]]; do
           #bring array[j] forward
           array[$(($j+1))]=${array[j]}
           #decrement j
           ((j--))
       done
       #put key in the next spot
       array[$(($j+1))]=$key
   done

   #print it all out
   for entry in "${array[@]}"; do
        echo $(basename "${entry}")
   done
}

#function call
reverse entries

