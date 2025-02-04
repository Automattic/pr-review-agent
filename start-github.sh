#!/bin/bash
source ./.env

# Set the GitHub Personal Access Token in a .env file in the root of the pr-review-agent folder
GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_PERSONAL_ACCESS_TOKEN

# Run the GitHub MCP server
cd $GITHUB_MCP_SERVER_PATH
npx .