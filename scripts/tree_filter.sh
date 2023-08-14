#!/bin/bash

###################################################################################################
# tree_filter.sh - A Bash script to filter data from a CSV file based on various
# criteria such as last modified date, file size, username, and file extension.
#
# Usage: 
#   ./tree_filter.sh <csv_file> <-d date> [-s size] [-u user_name] [-e extension] [-h]
#
# Options:
#   -d,    --date <date>         Displays all the files with the specified last modified date (YYYY-MM-DD). (e.g: 2023-07-25)
#   -s,    --size <size>         Displays all the files with given size and greater than that. (e.g: 300 , 1KB, 1GB)
#   -u,    --username <name>     Displays all the files with the specified username/owner. (e.g: leza)
#   -e,    --extension <ext>     Displays all the files with the specified extension.(Case-Insensitive) (e.g: .txt, .csv, .sh)
#   -h,    --help                Display this help message.
#
# Description:
#   This script takes a CSV file as input and filters its data based on the specified criteria.
#   The criteria can be the last modified date, file size, username/owner, and file extension.
#   The script uses command-line arguments to specify the filters.
#   The script will display the matching lines (rows) from the CSV file that meet the filter criteria.
#   The CSV file should have the following columns: permissions, owner, size, date, path, and filename.
#   If size is specified without a unit, it will be considered in bytes.
#   The script will display "No Results Found" if no matches are found after filtering.
#   If incorrect flags are provided, the script will display the help information.
#
# Functions:
#   1. display_usage: Displays the usage and help information for the script.
#   2. convert_to_timestamp: Converts a date to a Unix timestamp.
#   3. is_valid_flag: Checks if a flag is valid.
#   4. convert_to_bytes: Converts the size from human-readable format to bytes.
#   5. display_verbose: Displays verbose information (optional).
#   6. filter_data: Filters the CSV data based on specified criteria and displays matching lines.
#####################################################################################################



# Function to display usage and help information
function display_usage {
  echo -e "\nUsage: "
  echo -e "  $0 <csv_file> <-d date> [-s size] [-u user_name] [-e extension] [-h]"
  echo -e "\nOptions:"
  echo "  -d,    --date <date>         Displays all the files with the specified last modified date (YYYY-MM-DD). (e.g: 2023-07-25)"
  echo "  -s,    --size <size>         Displays all the files with given size and greater than that. (e.g: 300 , 1KB, 1GB)"
  echo "  -u,    --username <name>     Displays all the files with the specified username/owner. (e.g: leza)"
  echo "  -e,    --extension <ext>     Displays all the files with the specified extension.(Case-Insensitive) (e.g: .txt, .csv, .sh)"
  echo "  -h,    --help                Display this help message."

  echo -e "\nExamples:"
  echo -e "  -d,    --date      : ./filename datafile.csv -d 2023-07-12  | ./filename datafile.csv --date 2023-07-12"
  echo -e "  -s,    --size      : ./filename datafile.csv -s 700         | ./filename datafile.csv --size 3KB"
  echo -e "  -u,    --username  : ./filename datafile.csv -u leza        | ./filename datafile.csv --username leza"
  echo -e "  -e,    --extension : ./filename datafile.csv -e .sh         | ./filename datafile.csv --extension .sh"
  echo -e "  -h,    --hep       : ./filename datafile.csv -h             | ./filename datafile.csv --help"
  echo -e "\n"
}




# Custom header with desired column names and format
custom_header="                     Path                                       Filename         File Size   Last Modified Date  Username"
header_spacing="--------------------------------------------------------------------------------------------------------------------------------"
# Function to display verbose information (if enabled)
function display_verbose {
  if [ "$verbose" == "true" ]; then
    # Display the custom header with appropriate spacing
    echo "$custom_header"
    echo "%-100s\n" "---------------------------------------------------------------------------------------------------------------------------------"
  fi
}

# function to conver6 to timestamp 
function convert_to_timestamp {
  if [ -z "$1" ]; then
    echo "0"
    return
  fi
  date_filter="$1"
  date -d "$date_filter" +"%s"
}


# function to convert size to bytes
function convert_to_bytes {
  local size="$1"

  # Check if the size contains a valid unit (K, M, G, T)
  if [[ "$size" =~ ^[0-9]+[KMGTP]$ ]]; then
    local unit="${size: -1}"
    local value="${size%?}"

    case "$unit" in
      [Kk])
        echo "$((value * 1024))"
        ;;
      [Mm])
        echo "$((value * 1024 * 1024))"
        ;;
      [Gg])
        echo "$((value * 1024 * 1024 * 1024))"
        ;;
      [Tt])
        echo "$((value * 1024 * 1024 * 1024 * 1024))"
        ;;
      *)
        echo "$size"  # Size is in an invalid format; return it as it is
        ;;
    esac
  else
    # Size doesn't contain a valid unit, assume it's in bytes
    echo "$size"
  fi
}


# Check the number of arguments
if [ $# -lt 1 ]; then
  display_usage
  exit 1
fi

# Default values for optional parameters
extension=""
size=""
user_name=""
verbose="false"
csv_file=""
result_found="false"  # Initialize result_found here


# Process arguments using a while loop
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -d|--date)
      date_filter="$2"
      shift
      ;;
    -s|--size)
      # Get the next argument as the size filter value
      size="$2"
      shift
      ;;
    -u|--username)
      # Get the next argument as the username filter value
      filter_by_user_name="$2"  # Update the variable name to filter_by_user_name
      shift
      ;;
    -e|--extension)
      # Get the next argument as the extension filter value
      extension="$2"
      # Check if the extension starts with a dot, if not, add it
      if [ "${extension:0:1}" != "." ]; then
        extension=".$extension"
      fi
      shift
      ;;
    -h|--help)
      # Display help information and exit
      display_usage
      exit 0
      ;;
    *)
      # Assume that the current argument is the CSV file name
      if [ -f "$1" ]; then
        csv_file="$1"
      else
        echo "Error: CSV file '$1' not found."
        display_usage
        exit 1
      fi
      ;;
  esac

  shift
done



# Check if the size is provided and convert it to bytes
if [ -n "$size" ]; then
  size=$(convert_to_bytes "$size")
fi

# Check if the date filter is provided and convert it to a Unix timestamp
if [ -n "$date_filter" ]; then
  filter_by_date_timestamp=$(convert_to_timestamp "$date_filter")
else
  filter_by_date_timestamp=0  # Initialize the variable to 0 when the date filter is not provided
fi

# Check if the CSV file name is provided
# The -z flag checks for empty strings.
if [ -z "$csv_file" ]; then
  echo "Error: Please provide the CSV file name."
  exit 1
fi

# Check if the CSV file exists
# -f checks if it is a regular file (not a directory, device, or special file).
# ! is a logical NOT operator, ! -f "$csv_file" checks if the file does not exist.
if [ ! -f "$csv_file" ]; then
  echo "Error: CSV file '$csv_file' not found."
  exit 1
fi


# Function to filter and display the data
function filter_and_display_data {
  local data="$1"
  local filter_by_date="$2"
  local filter_by_extension="$3"
  local filter_by_size="$4"
  local filter_by_user_name="$5"

  # Display the header when verbose mode is enabled
  if [ "$verbose" == "true" ]; then
    display_verbose
  fi

  # Initialize an empty variable to store filtered data
  filtered_data=""
  
  # Initialize the unique ID counter
  unique_id_counter=0

  # Generate a unique ID using epoch date and a random number
  function generate_unique_id {
    local epoch_date=$(date +%s)  # Get the current epoch date
    local random_number=$((RANDOM % 100))  # Generate a random number between 0 and 99
    echo "${epoch_date}${random_number}"
  }

  # Loop through each line of the CSV data and process it
  local IFS=$'\n'  # Set the input field separator to newline to handle CSV lines correctly
  result_found="false"  # Initialize the result_found flag

  for line in $data; do
    # Extract fields from the CSV line
    file_permissions=$(echo "$line" | cut -d ',' -f 1)
    file_owner=$(echo "$line" | cut -d ',' -f 2)
    file_size=$(echo "$line" | cut -d ',' -f 3)
    file_date=$(echo "$line" | cut -d ',' -f 4)
    file_path=$(echo "$line" | cut -d ',' -f 5)
    file_name=$(echo "$line" | cut -d ',' -f 6)

    # Convert the file_date to a Unix timestamp
    file_date_timestamp=$(convert_to_timestamp "$file_date")

    # Convert the file extension to lowercase for case-insensitive comparison
    file_extension="${file_name##*.}"
    file_extension="${file_extension,,}"

    # Apply filters to each line of the CSV file
    if ( [ -z "$filter_by_date" ] || [ "$filter_by_date_timestamp" == "$file_date_timestamp" ] ) && \
       ( [ -z "$filter_by_extension" ] || [[ ".$file_extension" == *"$filter_by_extension" ]] ) && \
       ( [ -z "$filter_by_user_name" ] || [[ "${file_owner,,}" == *"${filter_by_user_name,,}" ]] ) && \
       ( [ -z "$filter_by_size" ] || [ "$file_size" -ge "$filter_by_size" ] ); then
      # Display matching lines with fields in the desired order using printf for formatting
      printf "%-60s  %-20s  %-10s  %-15s  %s\n" "$file_path" "$file_name" "$file_size" "$file_date" "$file_owner"

      # Generate a unique ID for the file
      unique_id=$(generate_unique_id)

      # Append the line with the unique ID to the filtered_data variable
      filtered_data+="$line,$unique_id\n"

      # Set the result_found flag to true
      result_found="true"
    fi
  done

  


  # Check if any matches were found
  if [ "$result_found" == "true" ]; then
    # Prompt the user to save the results
    echo " "
    read -p "Do you want to save the data to a file? (Y/N): " save_response
    case "$save_response" in
      [Yy])
        read -p "Enter the name of the output file (without extension): " output_name
        if [[ -z "$output_name" ]]; then
          echo "Please provide a valid output file name."
        else
          output_file="$output_name.csv"
          if [[ -e "$output_file" ]]; then
            echo "File '$output_file' already exists. Please choose a different name."
          else
            # Remove spaces around commas in the filtered data
            filtered_data_formatted=$(echo -e "$filtered_data" | sed 's/ *//g')

            # Save the filtered data to the output file
            echo -e "$filtered_data_formatted" > "$output_file"
            echo "Filtered data saved to $output_file."
          fi
        fi
        ;;
      [Nn])
        echo "Filtered data not saved."
        ;;
      *)
        echo "Invalid response. Please answer 'Y' or 'N'."
        ;;
    esac
  else
    echo "No Results Found"
  fi
}




echo "$header_spacing"
echo "$custom_header"
echo "$header_spacing"

# Display verbose information (if enabled)
display_verbose

# Filter and display the data
result_found="false"  # Default value to track whether any results were found
filter_and_display_data "$(tail -n +2 "$csv_file")" "$date_filter" "$extension" "$size" "$user_name"


# Check if any matches were found
if [ "$result_found" == "false" ]; then
  echo "No Results Found"
fi
