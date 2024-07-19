#!/bin/zsh

# Set the column width
COLUMN_WIDTH=50

# Function to count files in a folder
count_files() {
    local folder="$1"
    local file_count=$(find "$folder" -type f | wc -l)
    echo "$file_count"
}

# Main script
current_dir=$(pwd)

# Print subfolder and file count with alignment
for subfolder in *; do
    if [ -d "$subfolder" ]; then
        file_count=$(count_files "$current_dir/$subfolder")
        printf "%-${COLUMN_WIDTH}s: %s files\n" "$subfolder" "$file_count"
    fi
done
