#!/bin/bash
source $( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/.env

# Set the GitHub Personal Access Token in a .env file in the root of the pr-review-agent folder
GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_PERSONAL_ACCESS_TOKEN

# Run the GitHub MCP server
cd $( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/mcp-servers/src/github
npx .