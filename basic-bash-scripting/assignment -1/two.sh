#!/bin/bash
> even.txt
> odd.txt
read -p "Enter a list of numbers (separated by spaces): " -a numbers
for num in "${numbers[@]}"; do
    if (( num % 2 == 0 )); then
        echo "$num" >> even.txt
    else
        echo "$num" >> odd.txt
    fi
done
echo "Numbers have been sorted into even.txt and odd.txt."
