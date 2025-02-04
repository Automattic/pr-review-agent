#!/bin/bash
source $( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/.env

# Run the Git MCP server with the project repository path
cd $( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/mcp-servers/src/git
rm -rf .venv
uv run mcp-server-git --repository $PROJECT_REPOSITORY_PATH
