#!/bin/bash

# Define the directory containing your subfolders with Git repositories
base_directory="/home/your/main/directory/above/git/folders"

# Check if the base directory exists
if [ ! -d "$base_directory" ]; then
    echo "Base directory '$base_directory' not found. Please specify the correct path."
    exit 1
fi

# Loop through all subdirectories in the base directory
for sub_directory in "$base_directory"/*; do
    if [ -d "$sub_directory" ] && [ -d "$sub_directory/.git" ]; then
        echo "Updating Git repository in: $sub_directory"
        
        # Change directory to the Git repository
        cd "$sub_directory"
        
        # Perform a git pull
        git pull

        # Return to the base directory
        cd "$base_directory"
    fi
done

echo "Git pull completed for all repositories in '$base_directory'."
