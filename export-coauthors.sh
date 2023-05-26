#! /bin/bash

# Note 1: Some co-authors may use different DBLP names in different papers. These names are listed seperately.
# Note 2: Author name in DBLP may not exactly the same as that of conference PC member list.
#         For example, middle names are abbreviated or not.

if [ $# -lt 2 ]; then
    echo "Usage: $0 author_dblp_url start_year [file_name]"
    echo "e.g., $0 https://dblp.org/pid/07/3181.html 2020 coauthors-kuo.txt"
    exit 1
fi

author_dblp_url="$1" # e.g., https://dblp.org/pid/07/3181.html
start_year=$2 # e.g., 2019
file_name=$3 # save result to this file
if [ -z "$file_name" ]
then
    file_name="co-authors.txt"
fi

# Export bibliography from DBLP
find_str=".html"
replace_str=".xml"
# notice the the str isn't prefixed with $
result=${author_dblp_url//$find_str/$replace_str}

wget -q -O bib.xml $result
if file bib.xml | grep -q "gzip compressed"; then mv bib.xml bib.xml.gz; gunzip bib.xml.gz; fi

# Extract author name from paper records (frm specified year to now)
line=$(grep -iInh "year>$start_year" bib.xml |tail -n 1|cut -d ":" -f 1)

this_year=$(date +%Y)
while [ -z "$line" ] && [ $start_year -lt $this_year ]
do
    start_year=$(( $start_year + 1 ))
    line=$(grep -iInh "year>$start_year" bib.xml |tail -n 1|cut -d ":" -f 1)
done

if [ -z "$line" ]
then
    echo "No co-authors found."
else
    head -n $line bib.xml | grep author | cut -d ">" -f 2 | cut -d "<" -f 1 | perl -n -mHTML::Entities -mutf8 -e 'binmode(STDOUT, ":utf8"); print HTML::Entities::decode_entities($_) ;' | awk '{sub(/[0-9]+$/,"")}1' | awk '{$1=$1};1' |sort -u > $file_name
    echo "Saved co-authors to $file_name."
fi

rm -f bib.xml
