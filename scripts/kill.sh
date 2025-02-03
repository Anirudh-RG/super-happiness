#!/bin/bash

# Read the PID from the file
VITE_PID=$(cat vite_pid.txt)

# Check if the PID file exists
if [ -z "$VITE_PID" ]; then
    echo "PID file not found or is empty!"
    exit 1
fi

# Kill the process using the PID
echo "Terminating the development server with PID: $VITE_PID"
kill -9 $VITE_PID

# Clean up PID file
rm -f vite_pid.txt

echo "Server terminated."
