#!/bin/bash

# Get the current timestamp
TIMESTAMP=$(date +"%y%m%d-%H%M%S")

# Define the output file with a unique name
OUTPUT_FILE=~/Downloads/astro-site-${TIMESTAMP}.txt

# Clear the output file if it already exists (unlikely since it's unique)
> "$OUTPUT_FILE"

# Find and process files
find . -type f \( \
    -path './.astro/*' -o \
    -path './.vscode/*' -o \
    -path './dist/*' -o \
    -path './node_modules/*' -o \
    -path './.git/*' -o \
    -name 'package-lock.json' -o \
    -name '*.min.js' -o \
    -name '*.log' -o \
    -name '*.png' \
\) -prune -o -type f -print | while read -r FILE; do
    # Print the file path
    echo "### $FILE" >> "$OUTPUT_FILE"
    echo >> "$OUTPUT_FILE"

    # Print the file content
    cat "$FILE" >> "$OUTPUT_FILE"
    echo >> "$OUTPUT_FILE"
    echo >> "$OUTPUT_FILE"
done

echo "Output written to $OUTPUT_FILE"
