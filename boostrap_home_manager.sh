#!/usr/bin/env bash

#### TODO: MOVE TO FLAKE ONLY VERSION OF STUFF
#### https://nix-community.github.io/home-manager/index.html#ch-nix-flakes

## Let's get the repo first, in case we didn't before
cd
git clone https://github.com/cognivore/nix-home.git

## First populate .local/bin which has some spicy stuff for convenience CLI scripts
mkdir ~/.local
git clone https://github.com/cognivore/local-bin.git ~/.local/nbin

## Then link stuff in ~/.config (assuming you cloned this repo into ~/nix-home)
mkdir ~/.config
ln -sT "${HOME}/nix-home/nix" ~/.config/nix
ln -sT "${HOME}/nix-home/nixpkgs" ~/.config/nixpkgs

cat <<BEEP

Add ~/.local/nbin to your PATH: 
 - [ ] 'export PATH=$HOME/.local/nbin:$PATH'

Edit your ~/.config/nixpkgs/home.nix:
 - [ ] Set home.username to $(whoami).
 - [ ] Set home.homeDirectory to ${HOME}.

Afterwards, add the following to your ~/.bashrc:

"""
# Nix!
if [ -e \${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . \${HOME}/.nix-profile/etc/profile.d/nix.sh; fi

# Direnv!
export NIX_PATH=\$HOME/.nix-defexpr/channels\${NIX_PATH:+:}\$NIX_PATH
source \$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
eval "\$(direnv hook bash)"
"""

When you're done, press any key.
BEEP

read -r -n1 _any_key

## Then clone home-manager:
cd
git clone https://gitlab.com/rycee/home-manager

## Then drop into a nix shell and make the first generation!
NIX_PATH=nixpkgs=$(nix flake archive nixpkgs --json | jq -r .path):home-manager=$HOME/home-manager:$NIX_PATH \
        nix shell \
        --no-write-lock-file \
        home-manager \
        -c home-manager switch

