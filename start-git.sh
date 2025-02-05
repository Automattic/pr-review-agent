#!/bin/bash
PARENT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
source $PARENT_DIR/.env

# Run the Git MCP server with the project repository path
cd $PARENT_DIR/mcp-servers/src/git
rm -rf .venv
uv run mcp-server-git --repository $PROJECT_REPOSITORY_PATH

# Write the the PROJECT_REPOSITORY_PATH to the prompt.md file if it exists and is not already there
if [ -f "$PARENT_DIR/prompt.md" ]; then
  if ! grep -q "repo_path" "$PARENT_DIR/prompt.md"; then
    echo -e "\n\nThe project repo_path is: $PROJECT_REPOSITORY_PATH" >> $PARENT_DIR/prompt.md
  fi
fi
