#!/bin/bash

# Navigate to the project directory (in case this script is executed from another location)
cd "$(dirname "$0")/.."

# Install dependencies
echo "Installing dependencies..."
npm install

# Run the dev server
echo "Starting the development server..."
npm run dev
