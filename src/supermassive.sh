#!/bin/bash

# Supermassive CLI v0.0.1

# Function to handle git operations
function sm() {
    # Set the GPG_TTY environment variable to the current terminal
    export GPG_TTY=$(tty)

    # Handle different command-line options
    case "$1" in
        -c)
            # Commit option
            if [ -n "$3" ]; then
                # If a commit message is provided as the third argument
                git add "$2" && git commit -S -m "$3"
                echo "Committed successfully: $2 with message '$3'"
            elif [ -n "$2" ]; then
                # If only a commit message is provided
                git add . && git commit -S -m "$2"
                echo "Committed successfully: All files with message '$2'"
            else
                # Default commit message
                git add . && git commit -S -m "Init"
                echo "Committed successfully: All files with default message."
            fi
            ;;
        -p)
            # Push option
            git push
            echo "Pushed successfully."
            ;;
        -v)
            # Version option
            echo "Supermassive CLI v0.0.1"
            ;;
        -h)
            # Help option
            echo "Usage: sb [option] [args]"
            echo "Options:"
            echo "  -c <file|.> [message]  Commit changes with optional file and commit message."
            echo "  -p                     Push changes to the remote repository."
            echo "  -v                     Display version information."
            echo "  -h                     Display this help message."
            ;;
        *)
            # Default message for unsupported options
            echo "Thank you for using Supermassive Command Line Interface (CLI). (c) 2024 - SUPERMASSIVE INC."
            ;;
    esac
}
