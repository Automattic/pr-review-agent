#!/bin/bash
source $( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/.env

export GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_PERSONAL_ACCESS_TOKEN

# Run the GitHub MCP server
cd $( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/mcp-servers/src/github
npx .