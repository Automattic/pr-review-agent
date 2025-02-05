# Github PR Review Agent

A friendly PR review agent for Github PRs on your projects.

## Requirements

- [**uv**](https://docs.astral.sh/uv/getting-started/installation/)
- [**npx**](https://docs.npmjs.com/cli/v8/commands/npx): Install using: `npm i -g npx`
- [**cursor**](https://www.cursor.com/)

Note: the agent uses custom modifications to the base MCP servers from Anthropic, this is why you need to install them and run locally.

## Setup

1. Clone the repository.
2. Inside the cloned repository run `git submodule update --init --recursive` to get the mcp-servers.
3. Run `npm install --prefix mcp-servers` to install mcp-servers dependencies.
4. Copy the `.env.example` file to `.env` and fill in the required values. You will need a Github personal access token.
5. Copy the `prompt.example` file to `prompt.md` file and make any changes you need.
6. Open Cursor (v0.45+) and go to `Cursor -> Settings -> Cursor Settings -> Features -> MCP Servers`
7. Add the following MCP servers:
  * **Git**:
    - Name: `Git`
    - Type: `Command`
    - Command: `bash [PATH_TO_REVIEW_AGENT_FOLDER]/start-git.sh`
  * **Github**:
    - Name: `GitHub`
    - Type: `Command`
    - Command: `bash [PATH_TO_REVIEW_AGENT_FOLDER]/start-github.sh`
8. Restart Cursor (or Developer: Reload Window)
9. Go back to the MCP Servers settings, hit the refresh button and confirm you see the tools for both the Git and GitHub servers.
10. Add the following to your Cursor rules for AI, be sure to update the path to folder:

> When you see @@review used, always load the contents of this file first: [PATH_TO_REVIEW_AGENT_FOLDER]/prompt.md and follow the instructions. Use the PR URL given, or ask for a PR URL to use if there is none.

## Usage

1. Open the Cursor composer and select to use the "Agent".
    - Note: You do not need to be inside the project folder, however doing so will provide the agent with more context.
2. Type `@@review` and paste a link to a Github PR that has been opened for the project you pointed the `PROJECT_REPOSITORY_PATH` in `.env` to.
3. The agent will ask you to run a number of Github and Git MCP tools and gather the information it needs to review the PR.
4. The agent will then write a review of the PR and share it with you for approval.
5. Once you approve the review, the agent will post it as a comment on the PR.

## Notes

* This will also work for other MCP supporting tools like Claude Desktop, or Goose.
* ~The agent will only review the diff, it will not yet read the full PR description.~ The agent will now read your PR descriptions to guide its review.
* The agent will not yet make any changes to the PR, it will only review the diff.

## Future Work

* Continue experimenting with Goose CLI to see if this can be automated. I ran into tool calling issues with the canary branch.
* Get the agent to read the full PR description and use that as context for the review.
* Get the agent to follow testing instructions, and implement computer use to testing functionality.
* Get the agent to auto-respond to comments on the PR asking for clarification.
