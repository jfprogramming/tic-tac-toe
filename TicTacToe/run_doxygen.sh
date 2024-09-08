#!/bin/bash


# Define the path to the Doxygen configuration file
DOXYFILE_PATH="./Doxyfile"
OUTPUT_DIR="doxygen"

# Check if the Doxygen configuration file exists
if [ ! -f "$DOXYFILE_PATH" ]; then
    echo "Doxygen configuration file not found at $DOXYFILE_PATH"
    exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Run Doxygen
doxygen "$DOXYFILE_PATH"

sudo cp doxygen/latex/refman.pdf doxygen/refman.pdf

echo "Doxygen Command Complete..."
