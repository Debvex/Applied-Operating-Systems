#!/bin/bash
balance=5000 

while true; do
    echo " ATM Menu "
    echo "1. Deposit Money"
    echo "2. Withdraw Money"
    echo "3. Check Balance"
    echo "4. Exit"
    read -p "Select an option: " opt

    case $opt in
        1) 
            read -p "Enter amount to deposit: ₹" amount
            if [[ $amount -gt 0 ]]; then
                balance=$((balance + amount))
                echo "Successfully deposited ₹$amount."
            else
                echo "Invalid amount."
            fi
            ;;
        2) 
            read -p "Enter amount to withdraw: ₹" amount
            if [[ $amount -gt $balance ]]; then
                echo "Error: Insufficient balance!"
            elif [[ $amount -le 0 ]]; then
                echo "Invalid withdrawal amount."
            else
                balance=$((balance - amount))
                echo "Please collect your cash: ₹$amount."
            fi
            ;;
        3) 
            echo "Your current balance is: ₹$balance" 
            ;;
        4) 
            echo "Thank you for using the ATM."
            break 
            ;;
        *) 
            echo "Invalid selection." 
            ;;
    esac
    echo ""
done
