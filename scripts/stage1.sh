#!/bin/bash

# Navigate to the project directory
cd "$(dirname "$0")/.."

# Install dependencies (if needed)
echo "Installing dependencies..."
npm install

# Start the Vite dev server in the background
echo "Starting the development server..."
npm run dev &

# Capture the PID of the background server
VITE_PID=$!

# Save the PID to a file
echo $VITE_PID > vite_pid.txt

echo "Server is running at http://localhost:5173"
