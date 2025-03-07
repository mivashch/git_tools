#!/bin/bash

GITLAB_URL="GITLAB_URL"
GITHUB_URL="GITHUB_URL"

while read repo; do
    repo_name=$(basename "$repo" .git)

    echo "clone $repo_name..."
    git clone --mirror "$repo"

    echo "Creating GitHub repo..."
    curl -u "your_github_username:your_github_token" https://api.github.com/user/repos -d '{"name":"'"$repo_name"'"}'

    echo "transfering $repo_name on GitHub..."
    cd "$repo_name.git"
    git remote set-url --push origin "${GITHUB_URL}/${repo_name}.git"
    git push --mirror
    cd ..
    rm -rf "$repo_name.git"
done < gitlab_repos.txt

echo "Migration completed!" 