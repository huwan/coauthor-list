#!/bin/bash

current_year=$(date +"%Y")

# List of professors and their urls
declare -A urls=(
    ["Kuo"]="https://dblp.org/pid/07/3181.html"
    ["Xue"]="https://dblp.org/pid/x/ChunJasonXue.html"
    ["Guan"]="https://dblp.org/pid/45/5411.html"
)

# Function to generate coauthors list
generate_coauthors() {
    local lastname=$1
    local start_year=$2
    local num_years=$3

    local filename="Prof-${lastname}-past-${num_years}-"
    if [ "$num_years" -gt 1 ]; then
        filename+="years.txt"
    else
        filename+="year.txt"
    fi

    ./export-coauthors.sh "${urls[$lastname]}" "$start_year" "$filename"
}

# Generate coauthors list for the past 1 to 5 years for each professor
for lastname in "${!urls[@]}"; do
    for num_years in {1..5}; do
        start_year=$((current_year - num_years))
        generate_coauthors "$lastname" "$start_year" "$num_years"
    done
done
