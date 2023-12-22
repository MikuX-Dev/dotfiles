#!/usr/bin/env bash

clear

echo "Setting up with .ssh"
slepp 3s

printf "\n"
# Start the SSH agent and add keys
echo "Setting SSH agent and add keys"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_rsa
ssh-add ~/.ssh/gitlab_rsa

printf "\n"
# Test SSH connections
echo "Testing SSH connections"
ssh -T git@github.com
ssh -T git@gitlab.com

# printf "\n"
# # permission
# echo "Giving permission"
# chmod 700 ~/.ssh
# chmod 600 ~/.ssh/config
# chmod 600 ~/.ssh/github_rsa
# chmod 644 ~/.ssh/github_rsa.pub
# chmod 600 ~/.ssh/gitlab_rsa
# chmod 644 ~/.ssh/gitlab_rsa.pub
# chmod 644 ~/.ssh/known_hosts

printf "\n"
# Set your global username and email
echo "Setting global user and email"
git config --global user.name "MikuX-Dev"
git config --global user.email "abinishanth3464@gmail.com"

# Set default text editor (optional)
# git config --global core.editor

printf "\n"
echo "Done."
