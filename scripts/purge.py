# This script reads a csv file having file details
# and then it attempts to delete the files specified in the CSV.

import csv
import os
import sys
import datetime

# Check if the correct number of command-line arguments are provided
if len(sys.argv) != 2:
    print("Usage: python3 purge.py <csv_file>")
    sys.exit(1)

# Get the CSV file path from the command-line argument
csv_file_path = sys.argv[1]

# Check if the provided CSV file exists
if not os.path.exists(csv_file_path):
    print("CSV file not found.")
    sys.exit(1)

# Create a list to store deleted file records
deleted_files = []

# Read the CSV file
with open(csv_file_path, 'r') as csv_file:
    csv_reader = csv.reader(csv_file)
    for row in csv_reader:
        file_path = row[-3]
        if os.path.exists(file_path):
            # Get the current date and time
            deletion_datetime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

            # Remove the file
            os.remove(file_path)
            print(f"Deleted: {file_path}")

            # Store deleted file record (excluding the first column -file permissions )
            deleted_files.append(row[1:] + [deletion_datetime])  # Exclude the first column and add deletion datetime

        else:
            print(f"File not found: {file_path}")

# Append the deleted file records to the existing CSV file
if deleted_files:
    deleted_records_file = "purgedData.csv"
    file_exists = os.path.exists(deleted_records_file)
    with open(deleted_records_file, 'a', newline='') as csv_output:
        csv_writer = csv.writer(csv_output)
        csv_writer.writerows(deleted_files)
    print(f"Deleted file records appended to {deleted_records_file}")
else:
    print("No files were deleted.")
