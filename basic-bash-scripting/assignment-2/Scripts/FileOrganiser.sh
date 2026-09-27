#!/bin/bash

for file in *; do
    
    if [ -f "$file" ] && [ "$file" != "$0" ]; then
        
       
        ext="${file##*.}"
        
      
        case "$ext" in
            txt) folder="Text_Files" ;;
            jpg|jpeg|png|gif) folder="Images" ;;
            pdf) folder="PDFs" ;;
            sh) folder="Scripts" ;;
            *) folder="${ext^^}_Files" ;; # Default: converts extension to uppercase + _Files
        esac

        # Create the subfolder if it doesn't exist
        mkdir -p "$folder"
        
        # Move the file
        mv "$file" "$folder/"
        echo "Moved: $file -> $folder/"
    fi
done
