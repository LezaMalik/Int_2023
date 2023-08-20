# This script reads all the files from the nested folders with tree_task.sh script.
# It also saves the record in a csv file : tree_data.csv
# It then applies the desrired filters with the tree_filter.sh script.
# The result is saved in a csv file : filter_data.csv
# It then sends all the files with details via email to the desired sender with emailFile.py script.
# Finally, it purges all the files mentioned in the filter_data.csv file and saves the record to a csv file.
# If the files are not found, the purge.py saves the details of those files into missingData.csv file
# The purging part is done witht the help of this purge.py script.



#!/bin/bash

# Listing of all the files
./tree_task.sh #Give your path


# Filter files > 100KB and .txt extension
./tree_filter.sh tree_data.csv -e .txt  -s 100000

# Send Email
python3 emailFile.py filter_data.csv

# Purge Selected files
python3 purge.py filter_data.csv



