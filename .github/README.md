# Dotfiles

My dotfiles for macOS, managed with [Home Manager](https://github.com/nix-community/home-manager) (nix flakes) and [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
.dotfiles/
├── flake.nix          ← Home Manager flake
├── bootstrap.sh       ← One-command setup
├── home-manager/      ← stow package
│   └── .config/home-manager/home.nix
├── nix/               ← stow package
│   └── .config/nix/nix.conf
└── nvim/              ← stow package
    └── .config/nvim/init.lua
```

## Requirements

- Nix (installed by `bootstrap.sh` if missing)

## Setup

```bash
curl -fsSL https://raw.githubusercontent.com/hdahlheim/.dotfiles/main/bootstrap.sh | bash
```

Or manually:

```bash
# 1. Install Nix (Determinate Systems)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# 2. Clone
git clone git@github.com:hdahlheim/.dotfiles.git ~/.dotfiles

# 3. Stow config packages
cd ~/.dotfiles
nix run nixpkgs#stow -- -d ~/.dotfiles -t ~ home-manager nix nvim

# 4. Apply Home Manager config
nix run home-manager -- switch --flake ~/.dotfiles#hd
```

## Day-to-day

| Alias | Command |
|-------|---------|
| `hms` | Apply Home Manager config |
| `hme` | Edit `home.nix` |
| `update` | Update flake inputs and apply |
| `upgrade` | Upgrade nix itself |
