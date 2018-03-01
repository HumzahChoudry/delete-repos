# Deleting Repositories

This is a simple command line tool that will delete all git repositories that include a
given string.

## Setup

+ Run `brew install jq`

+ [jq](https://stedolan.github.io/jq/) is a command line JSON
processor that we'll be using when interacting with the github api.

+ Register a new [token on
github](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/) and give it both the `repo` scope and `delete_repo` scope. Copy this token to your clipboard. *Don't forget to delete this token after you're done.*

+ Call `sh delete-remote-repos.sh` to run the script and let it nuke away
