#!/bin/bash
# This script will print all the files
# in pwd and its subdirectories including details
# files permissions, file owner ,filesize, filename, filename with abs path, file last modified date
# and saves it in a csv ( comma seperated file )


# find command seaches for all the files in the path (for files '-type f' flag is used)
# $1 is the path to search for all the files (this is given as an argument while running the script)
# Piping '|' symbol allows us to take the ouput of the find command and pipe it to the next command as an input.
# xargs takes the ouput of the previous (find) command and gives it as in argument at the end of ls command. 
# ls command lists all files and the flag -lh prints the files in long human readable format. 
# > symbol redirects the ouput to a file named file.csv (only overwrites)

# cat file.csv displays the file called csv to the terminal
# | pipe allows us to take the ouput of cat command and give it to the next command as input
# awk command is used here to filter the output
# awk is allowing us to print the specific columns on the screen with comma separtion in between

# find "$1" -type f -exec ls -lh {} +: This finds all regular files in the specified directory passed as the first argument ($1) and executes the ls -lh command on them. The {} is replaced by the file names found by find, and the + ensures that multiple files are passed to a single ls command.
# | pipe allows us to take the ouput of cat command and give it to the next command as input
# awk command is used here to filter the output
# awk is allowing us to print the specific columns on the screen with comma separtion in between

# awk -F ' , ' sets the input field separator to ", " (comma followed by space) since data is separated by this pattern in the CSV file
# BEGIN { OFS=" , " } sets the output field separator to ", " , so the new column is separated by a comma and space
# split($NF, path_arr, "/") splits the last field (filename with absolute path) using "/" as the delimiter and stores the parts in the path_arr array
# path_arr[length(path_arr)] extracts the last element of the path_arr array, which is the filename
# print $0, path_arr[length(path_arr)] } prints the entire line (all fields) and then appends the extracted filename at the end


#find $1 -type f | xargs ls -lh > file.csv
#cat file.csv | awk '{print $1 " , " $3 " , " $5 " , " $6 " " $7 ", " $NF }' > file2.csv
find "$1" -type f -exec ls -lh {} + | awk '{print $1 " , " $3 " , " $5 " , " $6 " " $7 ", " $NF }' > file2.csv
awk -F ' , ' 'BEGIN { OFS=" , " } { split($NF, path_arr, "/"); print $0, path_arr[length(path_arr)] }' file2.csv > file3.csv
cat file3.csv
