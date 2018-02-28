# Deleting Repositories

This is a simple command line tool that will delete all git repositories that include a
given string.

## Setup

+ Run `brew install jq` [jq](https://stedolan.github.io/jq/) is a command line JSON
processor and we'll be using it to sort through the github api data.

+ Register a new [token on
github](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)
under the delete repo scope. Paste this token into a .txt file somewhere on your machine.
It doesn't matter where as long as you know the full path to that file.
____
Reading the token and password from your machine prevents your password and token from
being stored in your bash history.  
