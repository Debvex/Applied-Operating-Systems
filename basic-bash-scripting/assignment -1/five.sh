> todo.txt

while true; do
    echo "To-Do List Shell Script: \n"
    echo "1. Add a task"
    echo "2. View all tasks"
    echo "3. Delete a task"
    echo "4. Exit"
    read -p "Enter your choice (1-4): " choice

    case $choice in
        1)
            read -p "Enter task description: " task
            echo "$task" >> "$FILE"
            echo "Task added successfully!"
            ;;
        2)
            echo "--- Your Tasks ---"
            if [ -s "$FILE" ]; then
                # cat -n displays line numbers
                cat -n "$FILE"
            else
                echo "No tasks found. Your list is empty."
            fi
            ;;
        3)
            cat -n "$FILE"
            read -p "Enter the task number to delete: " task_num
            sed -i "${task_num}d" "$FILE"
            echo "Task #$task_num deleted."
            ;;
        4)
            echo "Exiting... Have a productive day!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
