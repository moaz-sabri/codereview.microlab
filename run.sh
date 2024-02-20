#!/bin/sh

# Function to copy files and folders
function sitemap() {
    php generate_sitemap.php
    echo "Files A"
}

function build() {
    # Get the current date and time in a suitable format (e.g., YYYYMMDD_HHMMSS)
    CURRENT_DATE=$(date +"%Y-%m-%d %H.%M")
    
    # Specify the source files and folders to copy
    SOURCE_FILES=("app" "static" "inc" ".htaccess" "favicon.ico" "index.php" "robots.txt" "sitemap.xml")
    
    # Specify the destination directory with the current date and time
    DESTINATION_DIR="dist_$CURRENT_DATE"
    
    # Create the destination directory if it doesn't exist
    mkdir -p "$DESTINATION_DIR"
    
    # Copy each source file or folder to the destination
    for file in "${SOURCE_FILES[@]}"; do
        cp -r "$file" "$DESTINATION_DIR"
    done
    
    # Optionally, display a message when the copying is complete
    echo "Files and folders copied to $DESTINATION_DIR"
    
}

# Function to copy files and folders
function unittest() {
    sh ./test/unittest.sh
}

function test4() {
    # Optionally, display a message when the copying is complete
    echo "Files D"
}


# Check the number of command-line arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 function_name"
    exit 1
fi

# Assign the argument to a variable
FUNCTION_NAME="$1"

# Determine which function to run based on the argument
case "$FUNCTION_NAME" in
    $FUNCTION_NAME)
        # Call the function from script1.sh
        $FUNCTION_NAME
    ;;
    *)
esac