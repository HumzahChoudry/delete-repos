read -p "What is your github username? " username

read -p "What phrase would you like to search for and remove? " phrase

read -s -p "What is your github personal access token? " token

echo "Hello $username, you want to delete all repos containing $phrase \n"

read -p "Is this information accurate? Reply y/n: " confirmation && [[ $confirmation == [yY] || $confirmation == [yY][eE][sS] ]] || exit 1

repo_urls=$(curl -H "Authorization: token $token" https://api.github.com/users/"$username"/repos?per_page=100000 |
jq -r '.[] | select(.name | contains('\"$phrase\"')) | .url')

for repo in ${repo_urls}; do
  echo "DELETING $repo"
  curl -H "Authorization: token $token" -X "DELETE" $repo
  echo "DELETED THAT JAWN, YEET"
done

curl https://api.github.com/zen
echo "\n"
