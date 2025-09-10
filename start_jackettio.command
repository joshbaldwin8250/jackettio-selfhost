#!/bin/bash

# Navigate to the Jackettio directory
cd "$(dirname "$0")"

echo "Checking if Docker Desktop is running..."

# Check if Docker daemon is running
if ! docker info > /dev/null 2>&1; then
    echo "Docker Desktop is not running. Attempting to start Docker Desktop..."
    # Open Docker Desktop application
    open -a Docker

    # Wait for Docker Desktop to start
    ATTEMPTS=0
    MAX_ATTEMPTS=60 # Wait up to 60 * 5 seconds = 5 minutes
    while ! docker info > /dev/null 2>&1 && [ $ATTEMPTS -lt $MAX_ATTEMPTS ]; do
        echo "Waiting for Docker Desktop to start (attempt $((ATTEMPTS+1))/$MAX_ATTEMPTS)..."
        sleep 5
        ATTEMPTS=$((ATTEMPTS+1))
    done

    if ! docker info > /dev/null 2>&1; then
        echo "Error: Docker Desktop failed to start after multiple attempts. Please start Docker Desktop manually and try again."
        exit 1
    else
        echo "Docker Desktop is now running."
    fi
else
    echo "Docker Desktop is already running."
fi

echo "Starting Jackettio addon..."
# Start the Jackettio addon
./cli.sh start

echo "Jackettio addon started. You can access it via the manifest URL provided during installation."