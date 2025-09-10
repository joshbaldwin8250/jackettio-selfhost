#!/bin/bash

# Navigate to the Jackettio directory
cd "$(dirname "$0")"

echo "Stopping Jackettio addon containers..."
# Stop the Jackettio addon
./cli.sh stop

echo "Jackettio addon containers stopped."
echo "To fully quit Docker Desktop, please do so manually from the macOS menu bar (right-click the Docker icon and select 'Quit Docker Desktop')."