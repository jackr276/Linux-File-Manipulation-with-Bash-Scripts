#Jack Robbins
#Homework Assignment 1, Problem 1

NEWLINE=$'\n'

#prompt user
read -p "Enter a directory that you would like to move to: " dir

#verify that directory exists, if it does not exit
if [ ! -d $dir ]; then
	echo "Invalid Entry, no directory named ${dir} ${NEWLINE}"
	exit 0
fi

#move into the directory, now that we know its validity
cd ./$dir

echo "All files in ${dir} ${NEWLINE} "
#list all the files
ls -1
echo "${NEWLINE}"

read -p "Please select a file by name: " fname


