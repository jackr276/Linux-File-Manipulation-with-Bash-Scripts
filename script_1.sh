#Jack Robbins
#Homework Assignment 1, Problem 1

#!bin/bash

NEWLINE=$'\n'

#prompt user
read -p "Enter a directory that you would like to move to: " dir

#verify that directory exists, if it does not exit
if [ ! -d "$dir" ]; then
    echo "Invalid Entry, no directory named ${dir} ${NEWLINE}"
    exit 0
fi

#move into the directory, now that we know its validity
cd "$dir"

echo "All files in ${dir} ${NEWLINE} "
#list all files only
for f in *; do
    [ -f "$f" ] && echo "$f"
done

echo "${NEWLINE}"

read -p "Please select a file: " fname

#So long as the file choice is bad, keep prompting the user
while [ ! -f "$fname" ]
do
    echo "File name is invalid, try again"
    read -p "Please select a file: " fname
done

#get the number of lines
lines=$(cat "$fname" | wc -l)

#compute the initial first and last bounds
last=$lines
first=$(($lines-9))

wantsDisp=$'yes'

#while the user wants more lines, keep printing more
while [ "$wantsDisp" == yes ]
do
   #If we hit the beginning of the file, leave the loop
   if [ $first -lt 0 ]; then
      head -$last "$fname" | tail +0
      echo "Beginning of file reached"
      break
   fi

   #print out ten lines
   head -$last "$fname" | tail +$first

   #update the lines
   last=$((last-10))
   first=$((first-10))

   #prompt user
   read -p "Would you like to diplay 10 more lines(yes/no): " wantsDisp
done
