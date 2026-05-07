#!/bin/bash
set -euo pipefail

echo '{"async": true, "asyncTimeout": 300000}'

cd "$CLAUDE_PROJECT_DIR"

echo "Installing npm dependencies..."
npm install
echo "Dependencies installed."

echo "Installing gstack skills..."
npm install -g skills 2>/dev/null || true
skills add habiz/gstack --global --all --yes --full-depth 2>/dev/null || true
echo "gstack skills installed."
