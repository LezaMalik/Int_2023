# This code reads a CSV file containing information about files and their sizes. 
# It calculates statistics about file extensions and presents the data in a formatted table. 
# The table display 5 columns in a well formatted form
# Columns are: Extension Type, Total File Size, Number of Files, Size % per extension, % Count per extension
# The user is given the option to save the calculated data to a new CSV file.
# This file works as report generator to filter files by extension.
# Usage: python3 myscript.py <input_csv_file>


# Import modules
import sys
import csv
import os

# Function to save data to a CSV file
def save_to_csv(rows, filename):
    if not filename.endswith('.csv'):
        filename += '.csv'
    with open(filename, 'w', newline='') as csv_file:
        csv_writer = csv.writer(csv_file)
        csv_writer.writerows(rows)

# Check if the correct number of command line arguments is provided
if len(sys.argv) != 2:
    print("Usage: python3 myscript.py <input_csv_file>")
    sys.exit(1)

# Get the input CSV filename from command line arguments
input_csv = sys.argv[1]

# Dictionary to store extension data
extension_data = {}

# Read the CSV file
with open(input_csv, 'r') as csv_file:
    csv_reader = csv.reader(csv_file)
    next(csv_reader)  # Skip the header

    # Loop through each row in the CSV
    for row in csv_reader:
        _, _, size, _, file_path, _ = row
        extension = os.path.splitext(file_path)[-1]  # Extract file extension
        size = int(size)

        # Update extension data dictionary
        if extension in extension_data:
            extension_data[extension]['count'] += 1
            extension_data[extension]['size'] += size
        else:
            extension_data[extension] = {'count': 1, 'size': size}

# Calculate total size of all files
total_size = sum(ext_info['size'] for ext_info in extension_data.values())

# Table header with formatting
table_header = f"{'Extension':<15}{'Size':<12}{'Count':<12}{'Size % ':<12}{'  Count % per ext':<12}"

# Calculate total number of files
total_files = sum(ext_info['count'] for ext_info in extension_data.values())

# Print formatted header
print("")
print('=' * len(table_header))
print(table_header)
print('=' * len(table_header))
print("")

# Display formatted data in a table
for extension, ext_info in extension_data.items():
    ext_size = ext_info['size']
    ext_count = ext_info['count']
    size_percentage = (ext_size / total_size) * 100
    count_percentage = (ext_count / total_files) * 100
    formatted_row = f"{extension:<15}{ext_size:<12}{ext_count:<12}{size_percentage:.2f}%{'':<12}{count_percentage:.2f}%"
    print(formatted_row)

# Print footer line
print('-' * len(table_header))
print("")

# Ask user if they want to save data to a CSV file
save_data = input("Do you want to save the data to a CSV file? (Y/N): ")
if save_data.lower() == 'y':
    while True:
        csv_filename = input("Enter CSV filename to save data: ")
        # Adds .csv extension to filename if not mentioned by user
        if not csv_filename.endswith('.csv'):
            csv_filename += '.csv'
        # Checks for a filename that does not already exists
        if os.path.exists(csv_filename):
            print("File already exists. Please choose a different filename.")
        else:
            # Save data to the specified CSV file
            with open(csv_filename, 'w', newline='') as csv_file:
                csv_writer = csv.writer(csv_file)
                for extension, ext_info in extension_data.items():
                    ext_size = ext_info['size']
                    ext_count = ext_info['count']
                    size_percentage = (ext_size / total_size) * 100
                    count_percentage = (ext_count / total_files) * 100
                    csv_writer.writerow([extension, ext_size, ext_count, f"{size_percentage:.2f}%", f"{count_percentage:.2f}%"])
                print("Data saved to", csv_filename)
                break
