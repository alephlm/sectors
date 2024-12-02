#!/bin/bash

# Function to extract id and description from <option> tags and generate SQL insert statements
generate_sql() {
    # Input: File containing HTML content
    local input_file="$1"
    
    # Define the output file
    local output_file="populate_sectors.sql"
    
    # Initialize the output file with a comment
    echo "-- SQL insert statements for sector table" > "$output_file"
    
    # Read each line in the input file and filter only option tags
    grep -o '<option[^>]*>[^<]*</option>' "$input_file" | while read -r line; do
        # Use regex to match <option> tags and capture value and description
        if [[ $line =~ \<option\ value=\"([0-9]+)\"\>(.*)\<\/option\> ]]; then
            # Extract the captured groups
            id="${BASH_REMATCH[1]}"
            description="${BASH_REMATCH[2]}"

            # Replace &amp; with & and remove any &nbsp;
            description=$(echo "$description" | sed 's/&amp;/\&/g; s/&nbsp;//g')
            
            # Generate the SQL insert statement and append to the output file
            echo "INSERT INTO sector (id, description) VALUES ($id, '$description');
            \echo sector :: $description :: added to the database" >> "$output_file"
        fi
    done

    # Confirm that the file was created
    echo "SQL statements saved to $output_file"
}

# Check if a file name was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

# Call the function with the provided input file
generate_sql "$1"