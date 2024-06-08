#!/bin/bash

sleep 10

# Exit immediately if a command exits with a non-zero status
set -e

# Clone the public repository
echo "Cloning the repository..."
git clone $REPO_URL /repo

sleep 5
buildkitd --addr unix:///run/buildkit/buildkitd.sock &
echo "done with repo clone and sleep"

# Navigate into the repository directory
cd /repo

# Assuming build commands or further operations go here
echo "Starting the build process..."
buildctl build --frontend dockerfile.v0 --local context=. --local dockerfile=.

echo "Build is completed, exiting"

# Further commands can be added below
