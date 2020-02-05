#!/usr/bin/env bash

# brew tap wix/brew
# brew update
# brew install applesimutils

# # Change ios.sim.release to the detox configuration you want to run

# echo "Building the project for Detox tests..."
# npx detox build --configuration ios.sim.release

# echo "Executing Detox tests..."
# npx detox test --configuration ios.sim.release --cleanup

echo "PRE BUILD STARTED"

echo "iOS: Installing applesimutils..."
brew tap wix/brew
brew install wix/brew/applesimutils

echo "Identifying selected node version..."
node --version

echo "Installing detox cli..."
npm install -g detox-cli

echo "iOS: Building the project for Detox tests..."
npx detox build --configuration ios.sim.release

echo "iOS: Cleaning cache for Detox tests..."
npx clean-framework-cache && detox build-framework-cache

echo "iOS: Executing Detox tests..."
npx detox test --configuration ios.sim.release --cleanup

echo "PRE BUILD COMPLETED"
