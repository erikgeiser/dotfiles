#!/bin/bash

RCFILES=(
  "aliases"
  "gitconfig"
  "gitignore_global"
  "inputrc"
  "npmrc"
  "screenrc"
  "shellrc_physics"
  "zprofile"
  "zshrc"
)

action() {
  local BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local DOTFILE_DIR=$BASE/dotfiles
  local BACKUP_DIR=$BASE/backup

  symlink() {
    local GREEN='\033[0;32m'
    local YELLOW='\033[0;33m'
    local CYAN='\033[0;36m'
    local NC='\033[0m' # No Color

    local RCFILE=$1
    if [[ -L ~/.$RCFILE ]]; then
      printf "${YELLOW}[!] ~/.$RCFILE is already a symlink, skipping${NC}\n"
    else
      printf "${GREEN}[*] Creating symlink for ~/.$RCFILE${NC}\n"
      if [[ -f ~/.$RCFILE ]]; then
        printf "$   ${CYAN}-> [i] Backing up old file to $BACKUP_DIR/$RCFILE${NC}\n"
        mv ~/.$RCFILE $BACKUP_DIR/$RCFILE
      fi
      ln -s $DOTFILE_DIR/$RCFILE ~/.$RCFILE
    fi
  }


  mkdir -p $BACKUP_DIR

  for RCFILE in "${RCFILES[@]}"; do
    symlink $RCFILE
  done
}

action "$@"
