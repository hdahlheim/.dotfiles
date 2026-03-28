#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${HOME}/.dotfiles"
DOTFILES_REPO="git@github.com:hdahlheim/.dotfiles.git"

# 1. Install Nix if missing (Determinate Systems installer)
if ! command -v nix &>/dev/null; then
  echo "Installing Nix..."
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# 2. Clone dotfiles
if [ ! -d "$DOTFILES_DIR" ]; then
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

# 3. Stow config packages using nix run (no prior stow install needed!)
cd "$DOTFILES_DIR"
nix run nixpkgs#stow -- -d "$DOTFILES_DIR" -t "$HOME" home-manager nix nvim mise

# 4. Apply Home Manager config via flake
nix run home-manager -- switch --flake "$DOTFILES_DIR#mbp2501"
