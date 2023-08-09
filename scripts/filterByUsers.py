# This code reads a CSV file containing information about files and their stats. 
# It calculates stats about file users and presents the data in a formatted table. 
# The table display 5 columns
# Username, FileSize, FileCount, FileSize % per user, FileCount % per user
# The user is given the option to save the calculated data to a new CSV file.
# Usage: python3 filterByUsers.py <input_csv_file>


# Import necessary modules
import sys
import csv
import os
import re

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

# Dictionary to store user data
user_data = {}



# Read the CSV file with mixed format
with open(input_csv, 'r') as csv_file:
    for line in csv_file:
        fields = re.split(r'\s*,\s*', line.strip())
        username = fields[1]
        size = int(fields[2])
        if username in user_data:
            user_data[username]['count'] += 1
            user_data[username]['size'] += size
        else:
            user_data[username] = {'count': 1, 'size': size}

# Calculate total size of all files
total_size = sum(user_info['size'] for user_info in user_data.values())

# Prepare table header
table_header = f"{'Username':<15}{'FileSize':<12}{'FileCount':<12}{'Size % ':<12}{'FileCount % per user':<12}"

# Calculate total number of files
total_files = sum(user_info['count'] for user_info in user_data.values())

# Print formatted header
print("")
print('=' * len(table_header))
print(table_header)
print('=' * len(table_header))
print("")

# Display formatted data in a table
for username, user_info in user_data.items():
    user_size = user_info['size']
    user_count = user_info['count']
    size_percentage = (user_size / total_size) * 100
    count_percentage = (user_count / total_files) * 100
    formatted_row = f"{username:<15}{user_size:<12}{user_count:<12}{size_percentage:.2f}%{'':<12}{count_percentage:.2f}%"
    print(formatted_row)

# Print footer line
print('-' * len(table_header))
print("")

# Ask user if they want to save data to a CSV file
save_data = input("Do you want to save the data to a CSV file? (Y/N): ")
if save_data.lower() == 'y':
    while True:
        csv_filename = input("Enter CSV filename to save data: ")
        if not csv_filename.endswith('.csv'):
            csv_filename += '.csv'
        if os.path.exists(csv_filename):
            print("File already exists. Please choose a different filename.")
        else:
            # Save data to the specified CSV file
            with open(csv_filename, 'w', newline='') as csv_file:
                csv_writer = csv.writer(csv_file)
                for username, user_info in user_data.items():
                    user_size = user_info['size']
                    user_count = user_info['count']
                    size_percentage = (user_size / total_size) * 100
                    count_percentage = (user_count / total_files) * 100
                    csv_writer.writerow([username, user_size, user_count, f"{size_percentage:.2f}%", f"{count_percentage:.2f}%"])
                print("Data saved to", csv_filename)
                break
