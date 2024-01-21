#Jack Robbins
#Homework Assignment 1, Problem 3

#!/bin/bash

#Read all of the command line arguments into the arguments array
args="$@"

#insertion sort function
function insertion_sort(){
	#get array as command line argument
	array=($@)
	#get size of array
	size=${#array[@]}
	
	#insertion sort algorithm
	for((i = 1; i < $size; i++)); do
		#get each array element as a key
		key=(${array[i]})
		
		#Declare j
		let "j = $i-1"
		
		#while j more than key, perform swap
		while [[ $j -ge 0 ]] && [[ ${array[j]} -gt $key ]]; do
			#bring array[j] forward
			array[$(($j+1))]=${array[j]}
			
			#decrement j with arithmetic expansion
			((j--))
			
			
		done
		#put key in the next spot
		array[$(($j+1))]=$key
	done
}

#function call
insertion_sort ${args[@]}
#print out result
echo ${array[@]}
