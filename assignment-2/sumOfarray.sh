#!/bin/bash

read -p "Enter numbers separated by spaces: " -a numbers

sum=0

for num in ${numbers[@]}
do
    sum=$((sum + num))
done

echo "Sum of array elements: $sum"
