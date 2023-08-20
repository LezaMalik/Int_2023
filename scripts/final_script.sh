#!/bin/bash

# Listing of all the files
./tree_task.sh #Give your path


# Filter files > 100KB and .txt extension
./tree_filter.sh tree_data.csv -e .txt  -s 100000

# Send Email
python3 emailFile.py filter_data.csv

# Purge Selected files
python3 purge.py filter_data.csv



