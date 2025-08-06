#!/usr/bin/env bash

script_dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
dry="0"

while [[ $# > 0 ]]; do
  if [[ $1 == "--dry" ]]; then
    dry="1"
  fi
  shift
done

log() {
  if [[ $dry == "1" ]]; then
    echo "[DRY_RUN]: $@"
  else
    echo "$@"
  fi
}

execute() {
  log "Execute $@"

  if [[ dry == "1" ]]; then
    return
  fi

  "$@"
}

copy_dir() {
  to=$2

  pushd $1
  dirs=$(find . -mindepth 1 -maxdepth 1 -type d)
  for dir in $dirs; do
    execute rm -rf $to/$dir
    execute cp -r $dir $to/$dir
  done
  popd
}

copy_file() {
    from=$1
    to=$2
    name=$(basename $from)
    execute rm $to/$name 
    execute cp $from $to/$name
}


log "------- dev-env -------"

copy_dir .config $HOME/.config
copy_dir .local $HOME/.local

copy_file .bashrc $HOME
copy_file .gitconfig $HOME
copy_file .gitconfig-work $HOME
copy_file .wezterm.lua $HOME
copy_file .zshrc $HOME

# reload hyprloand
hyprctl reload
