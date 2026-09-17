#!/bin/bash
read -p "Enter a number of seconds for the timer: " seconds
while [ "$seconds" -gt 0 ]; do
    echo -ne "Time remaining: $seconds seconds\033[0K\r"
    sleep 1
    ((seconds--))
done
echo -e "\nCount down finished!"
