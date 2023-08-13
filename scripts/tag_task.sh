# This file takes flags as returns the filtered files.
#!/bin/bash

# Function to print the last modified date of the file
function last_modified_date() {
    filename="$1"
    # Check if the file exists
    if [ -e "$filename" ]; then
        # Get the last modified date using the 'stat' command and print it
        last_modified=$(stat -c %y "$filename")
        echo "Last Modified Date: $last_modified"
    else
        echo "Error: File not found."
    fi
}

# Function to print the extension of the file
function extension() {
    filename="$1"
    # Check if the file exists
    if [ -e "$filename" ]; then
        # Extract the extension from the filename using parameter expansion and print it
        extension="${filename##*.}"
        echo "Extension: $extension"
    else
        echo "Error: File not found."
    fi
}

# Function to print the owner name of the file
function owner_name() {
    filename="$1"
    # Check if the file exists
    if [ -e "$filename" ]; then
        # Get the owner name using the 'stat' command and print it
        owner=$(stat -c %U "$filename")
        echo "Owner: $owner"
    else
        echo "Error: File not found."
    fi
}

# Function to print the size of the file
function file_size() {
    filename="$1"
    # Check if the file exists
    if [ -e "$filename" ]; then
        # Get the size of the file using the 'stat' command and print it
        size=$(stat -c %s "$filename")
        echo "Size: $size bytes"
    else
        echo "Error: File not found."
    fi
}

# Function to print help for the above commands
function help() {
    echo "Usage: $0 <filename> <tag>"
    echo "Tags:"
    echo "  -d : print the last modified date of the file"
    echo "  -e : print the extension of the file"
    echo "  -o : print the owner name of the file"
    echo "  -s : print the size of the file"
    echo "  -h : print help for the above commands"
}

# Read the filename and tag from the command-line arguments
filename="$1"
tag="$2"

# Use a switch case to perform the corresponding action based on the provided tag
case "$tag" in
    -d)
        last_modified_date "$filename"
        ;;
    -e)
        extension "$filename"
        ;;
    -o)
        owner_name "$filename"
        ;;
    -s)
        file_size "$filename"
        ;;
    -h)
        help
        ;;
    *)
        echo "Error: Invalid tag. Use -h for help."
        ;;
esac
