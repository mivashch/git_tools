#!/bin/bash

GITLAB_URL="https://gitlab-stud.elka.pw.edu.pl/mivashch"
GITHUB_URL="https://github.com/mivashch"

while read repo; do
    repo_name=$(basename "$repo" .git)

    echo "clone $repo_name..."
    git clone --mirror "$repo"

    echo "Creating GitHub repo..."
    curl -u "your_github_username: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" https://api.github.com/user/repos -d '{"name":"'"$repo_name"'"}'

    echo "transfering $repo_name on GitHub..."
    cd "$repo_name.git"
    git remote set-url --push origin "${GITHUB_URL}/${repo_name}.git"
    git push --mirror
    cd ..
    rm -rf "$repo_name.git"
done < gitlab_repos.txt

echo "Migration completed!"