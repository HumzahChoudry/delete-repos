read -p "What is your github username? " username

read -p "What phrase would you like to search for and remove? " phrase

read -p "What is the full path to your github token? " token_path

echo "Hello $username, you want to delete all repos containing $phrase and your github auth token is in this file: $token_path \n"

read -p "Is this information accurate? Reply y/n: " confirmation && [[ $confirmation == [yY] || $confirmation == [yY][eE][sS] ]] || exit 1

github_token="$(cat "$token_path")"
echo $github_token

repo_urls=$(curl https://api.github.com/users/realAndrewCohn/repos |
jq -r '.[] | select(.name | contains("web-1116")) | .url')

echo $repo_urls
# for repo in $repo_urls; do
#   echo "DELETING $repo"
#   curl -H "Authorization: token $github_token" -X "DELETE" $repo
#   echo "DELETED THAT JAWN, YEET"
# done

curl https://api.github.com/zen
echo "\n"
