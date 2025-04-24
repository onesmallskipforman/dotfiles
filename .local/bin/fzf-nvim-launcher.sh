#!/bin/zsh

# experimenting with nested menus
{ find $PWD -maxdepth 1 -mindepth 1; dirname $PWD } \
  | fzf \
    --bind 'enter:transform([[ -f {} ]] \
      && echo "execute(nvim {})" \
      || echo "reload(find {} -maxdepth 1 -mindepth 1; dirname {})" )'
