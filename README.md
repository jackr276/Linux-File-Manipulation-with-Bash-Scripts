# Linux File Manipulation with Bash Scripts
Author: [Jack Robbins](https://www.github.com/jackr276)

This repository contains 5 bash scripts that perform file manipulation, printing and ordering in Linux.

## [Script 1](https://github.com/jackr276/Linux-file-manipulation-with-bash-scripts/blob/main/src/script_1.sh)
Script 1 prompts the user for the name of a directory, and upon verifying that the directory exists, displays the contents to the user. It then asks the user to
select a file to display, and displays the file, 10 lines at a time, until the user stops confirming that more lines should be displayed or until the top of the
file is reached.

## [Script 2](https://github.com/jackr276/Linux-file-manipulation-with-bash-scripts/blob/main/src/script_2.sh)
Script 2 takes in the name of a directory as a command-line argument and uses an insertion-sort algorithm to display the contents of the directory in the reverse 
order as to what would be obtained using filename expansion.

## [Script 3](https://github.com/jackr276/Linux-file-manipulation-with-bash-scripts/blob/main/src/script_3.sh)
Script 3 takes in integers as command line arguments and sorts them, using an insertion sort algorithm.

## [Script 4](https://github.com/jackr276/Linux-file-manipulation-with-bash-scripts/blob/main/src/script_4.sh)
Script 4 uses an associative array and regular expression pattern matching to get the number of entries under `/bin` whose names begin with each letter of the
alphabet.

## [Script 5](https://github.com/jackr276/Linux-file-manipulation-with-bash-scripts/blob/main/src/script_5.sh)
Script 5 uses a recursive depth-first search traversal to go through a directory and all of its nested subdirectories and find any files that have the same name. 
If such a file is found, the user will be notified and asked if they would like to delete the duplicate file. If the user confirms the deletion, the duplicate file
is deleted.
