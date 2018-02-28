echo "What is your github username?"
read username

echo "What phrase would you like to remove?"
read phrase

echo "What is the full path to your github token?"
read token_path

echo "Hello $username, you want to delete all repos containing $phrase and your github auth token is in this file: $token_path \n"

echo "Is this information accurate? Reply y/n"
read confirmation

if [[ $confirmation == "n" ]]; then
  echo "Exiting..."
  exit 1
fi

GITHUB_TOKEN="$(cat ~/.gh-token.txt)"
#
# REPO_URLS=$(curl https://api.github.com/users/realAndrewCohn/repos |
# jq -r '.[] | select(.name | contains("web-1116")) | .url')
#
# for repo in $REPO_URLS; do
#   echo "DELETING $repo"
#   curl -H "Authorization: token $GITHUB_TOKEN" -u realAndrewCohn -X "DELETE" $repo
#   echo "DELETED THAT JAWN, YEET"
# done

curl https://api.github.com/zen
echo "\n"
