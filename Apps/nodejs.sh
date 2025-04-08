#!/bin/bash

# Install NodeJS and NPM
sudo apt-get update
sudo apt-get install -y nodejs npm

# Print installed versions
echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"

# Download the artifact
wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz

# Unzip the downloaded file
tar -xzf bootcamp-node-envvars-project-1.0.0.tgz

# Change into the correct directory
cd package

# Set environment variables
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

# Install dependencies and run the application
npm install
node server.js &

echo "Node app is running in the background"

