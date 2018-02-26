# curl -u realAndrewCohn -X "DELETE" https://api.github.com/repos/realAndrewCohn/web-js-oo-task-list-web-1116

# list repos
# curl  https://api.github.com/users/realAndrewCohn/repos | jq '.'
# return first repo
repo=$(curl  https://api.github.com/users/realAndrewCohn/repos | jq '.[0] | {name} ')

if [[ $repo =~ .*web-1116.* ]]
then
  echo "FOUND"
fi


# curl https://api.github.com/zen
echo "\n"

# curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.'
