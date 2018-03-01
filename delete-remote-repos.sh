# colors for printing output to user
RED="\033[0;31m"
GREEN="\033[0;32m"
PURPLE="\033[0;35m"
NC="\033[0m"

read -p "What is your github username? " username

read -p "What phrase would you like to search for and remove? " phrase

read -s -p "What is your github personal access token? " token

echo -e "\nHello ${PURPLE}$username${NC}, you want to delete all repos containing ${RED}$phrase${NC}\n"

read -p "Is this information accurate? Reply y/n: " confirmation && [[ $confirmation == [yY] || $confirmation == [yY][eE][sS] ]] || exit 1

repo_urls=$(curl -H "Authorization: token $token" https://api.github.com/users/"$username"/repos?per_page=100000 |
jq -r '.[] | select(.name | contains('\"$phrase\"')) | .url')

echo "${GREEN}$repo_urls${NC}\n"

read -p "Would you like to delete the github repos listed above? Reply y/n: " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

echo "\nPreparing to nuke your repos..."

for repo in ${repo_urls}; do
  echo "\n${RED}DELETING $repo${NC}"
  curl -H "Authorization: token $token" -X "DELETE" "$repo"
done

echo "\n${GREEN}Thx ${PURPLE}$USER${GREEN} for using this dank tool${NC}\n"
