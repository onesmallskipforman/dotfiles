#!/bin/zsh

# create PR
GH_TOKEN=$(cat ~/work/PATs/github_pat) \
  gh pr create --template pull_request_template.md

# generate PR message to send to others
# NOTE: you need to enable markup in slack:
# https://stackoverflow.com/questions/36294962/slack-markdown-for-links-are-not-resolving
JSON=$(GH_TOKEN=$(cat ~/work/PATs/github_pat) gh pr view --json 'title,url')
TITLE=$(echo $JSON | jq -r '.title' | sed 's/^\[[^ ]*\] *//g')
URL=$(echo $JSON | jq -r '.url')
MSG="[PR]($URL): $TITLE. Can I get approval? Thank you :)"
echo $MSG | xclip -selection c
echo "Message copied to clipboard: $MSG"
