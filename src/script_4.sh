#Jack Robbins
#Homework 1, problem 4

#!bin/bash

#navigate to bin directory
cd /bin

#declare our associative array
declare -A first_letter_counts

#iterate from a to z
for letter in {a..z}; do
    first_letter_counts["$letter"]=$(ls -1 [$letter]* | wc -l)
done


#print out the associative array
for key in {a..z}; do
    echo "${key}   ${first_letter_counts[${key}]}"
done
