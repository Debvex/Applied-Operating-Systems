#!/bin/bash
echo "--- Simple Calculator ---"
read -p "Enter the first number: " num1
read -p "Enter an operator (+, -, *(in the form of \*), /): " op
read -p "Enter the second number: " num2
case $op in
    +) result=$((num1 + num2)) ;;
    -) result=$((num1 - num2)) ;;
    \*) result=$((num1 * num2)) ;;
    /) 
        if [ "$num2" -eq 0 ]; then
            echo "Error: Division by zero is not allowed."
            exit 1
        fi
        result=$((num1 / num2)) 
        ;;
    *) 
        echo "Error: Invalid operator."
        exit 1 
        ;;
esac
echo "Result: $num1 $op $num2 = $result"
