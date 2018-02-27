# curl -u realAndrewCohn -X "DELETE" https://api.github.com/repos/realAndrewCohn/web-js-oo-task-list-web-1116

curl https://api.github.com/users/realAndrewCohn/repos |
jq '.[] | select(.name | contains("web-1116")) | .html_url'


# curl https://api.github.com/zen
echo "\n"
