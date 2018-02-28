echo "What is your github username?"
read username

echo "What phrase would you like to search for and remove?"
read phrase

echo "What is the full path to your github token?"
read token_path

echo "What is the full path to your github password?"
read password_path

echo "Hello $username, you want to delete all repos containing $phrase and your github auth token is in this file: $token_path \n"

echo "Is this information accurate? Reply y/n"
read confirmation

if [[ $confirmation == "n" ]]; then
  echo "Exiting..."
  exit 1
fi

github_token="$(cat $token_path)"
password=$(cat $password_path)

repo_urls=$(curl https://api.github.com/users/realAndrewCohn/repos |
jq -r '.[] | select(.name | contains("web-1116")) | .url')

for repo in $repo_urls; do
  echo "DELETING $repo"
  curl -H "Authorization: token $github_token" -u $username:$password -X "DELETE" $repo
  echo "DELETED THAT JAWN, YEET"
done

curl https://api.github.com/zen
echo "\n"
