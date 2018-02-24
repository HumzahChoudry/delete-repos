# curl -u realAndrewCohn -X "DELETE" https://api.github.com/repos/realAndrewCohn/web-js-oo-task-list-web-1116

# list repos
repos=$(curl  https://api.github.com/users/realAndrewCohn/repos)

for repo in $(echo $repos | jq '.'); do
  echo ${repo}
done



curl https://api.github.com/zen
echo "\n"
