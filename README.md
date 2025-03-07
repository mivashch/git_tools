**Simple tool to migrate all your GitLab repos to GitHub**

- get repositories lis by running: `curl --header "PRIVATE-TOKEN: YOUR_GITLAB_TOKEN" "https://<gitlab-istation>" | jq -r '.[].http_url_to_repo'`
- rename it to gitlab_repos.txt
- run ./Migrater.bash(Maybe it will be needed to make it executable, to do so run chmod +x Migrater.bash)

