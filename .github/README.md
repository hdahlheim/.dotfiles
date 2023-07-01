# Dotfiles

This is my dotfile repo for my Mac. 

Most of the dotfiles are managed through home-manager.

## Requirements

- nix
- Home Manager

## Setup 

Clone the repo as a bare git repo `git clone --bare <git-repo-url> $HOME/.dotfiles`
and checkout the main branch into your home directory 
`/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout`
Run `home-manager switch` to apply the config.
