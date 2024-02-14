#!/bin/bash

# Check if at least 3 arguments are given (# of arguments is less than 3)
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <directory> <search_pattern> <replace_pattern>"
    exit 1
fi

# Assign arguments to variables
DIRECTORY=$1
SEARCH_PATTERN=$2
REPLACE_PATTERN=$3

# Check if the specified directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Directory does not exist: $DIRECTORY"
    exit 1
fi

# Use find to locate files and read them line by line
find "$DIRECTORY" -type f | while read file; do
    # Extract directory path and filename
    dir=$(dirname "$file")
    base=$(basename "$file")
    
    # Check if the file name contains the search pattern
    if [[ "$base" == *"$SEARCH_PATTERN"* ]]; then
        # Construct new filename by replacing the search pattern with the replace pattern
        newbase="${base//$SEARCH_PATTERN/$REPLACE_PATTERN}"
        newpath="$dir/$newbase"
        
        # Rename the file
        mv "$file" "$newpath"
        echo "Renamed '$file' to '$newpath'"
    fi
done

echo "Renaming completed."
