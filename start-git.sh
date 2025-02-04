#!/bin/bash
source ./.env

# Run the Git MCP server
cd $GIT_MCP_SERVER_PATH

# Run the Git MCP server with the project repository path
uv run mcp-server-git --repository $PROJECT_REPOSITORY_PATH