#!/bin/bash
# This script will print all the files
# in pwd and its subdirectories including details
# files permissions, file owner, filesize in bytes, file last modified date (in the format YYYY-MM-DD), filename with abs path, filename
# and saves it in a csv (comma-separated file)
# Usage: ./tree_task.sh <absolute-path>

find "$1" -type f -exec ls -lh --time-style=long-iso --block-size=1 {} + | awk '{split($6, a, "-"); print $1 " , " $3 " , " $5 " , " a[1]"-"a[2]"-"a[3] " , " $NF }' > treefile.csv
awk -F ' , ' 'BEGIN { OFS=" , " } { split($NF, path_arr, "/"); print $0, path_arr[length(path_arr)] }' treefile.csv > tree_data.csv
cat tree_data.csv
