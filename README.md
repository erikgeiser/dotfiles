# Dotfiles

Repository for dotfile management.

## Setup

To setup the dotfiles run:

```bash
./setup.sh
```

This script will backup the old files into a `backup` folder inside this repo and create symlinks from the dotfiles in this repo to the home directory, where the dot is automatically prepended. If the files in the home directory is already a symlink, it will be skipped.

## Add new dotfiles

To add new dotfiles just create a new file in the `dotfiles` directory (without the dot for convernience) and add the name (without the path) to the `RCFILES` array in setup.sh


## TODO

*  Add option to automatically symlink any files in the `dotfiles` directory
