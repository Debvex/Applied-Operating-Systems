#!/bin/bash
echo "Present location:"
pwd

mkdir -p Folder
cd Folder || exit

read -p "Enter the name of the file you want to create: " filename
read -p "Write something to put in the file: " content

echo "$content" > "$filename"

word_count=$(wc -w < "$filename")
echo "Total number of words in '$filename': $word_count"

echo "File type:"
file "$filename"
