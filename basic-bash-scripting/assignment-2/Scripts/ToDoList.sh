#!/bin/bash

FILE="todo.txt"

# --- Functions ---

add_task() {
    read -rp "Enter task: " task
    if [[ -z "$task" ]]; then
        echo "Error: Task cannot be empty."
        return
    fi
    echo "$task" >> "$FILE"
    echo "Task added: $task"
}

view_tasks() {
    if [[ ! -f "$FILE" ]]; then
        echo "No tasks found."
        return
    fi
    echo "=== Tasks ==="
    cat "$FILE"
}

delete_task() {
    read -rp "Enter task to delete: " target
    if [[ -z "$target" ]]; then
        echo "Error: Empty input."
        return
    fi
    tmp=$(mktemp)
    grep -vx "$target" "$FILE" > "$tmp" 2>/dev/null
    if [[ $? -eq 0 ]] && [[ -s "$tmp" ]]; then
        mv "$tmp" "$FILE"
        echo "Task deleted: $target"
    elif [[ -s "$tmp" ]]; then
        mv "$tmp" "$FILE"
        echo "Task deleted: $target"
    else
        rm -f "$tmp"
        echo "Task not found: $target"
    fi
}

# --- Menu Loop ---

while true; do
    echo "
========================================
     Task Manager
========================================
  1. Add a task
  2. View all tasks
  3. Delete a task
  4. Exit
========================================"
    read -rp "Choose an option [1-4]: " choice

    case "$choice" in
        1) add_task ;;
        2) view_tasks ;;
        3) delete_task ;;
        4) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option. Try again." ;;
    esac
done