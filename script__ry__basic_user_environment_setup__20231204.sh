#!/usr/bin/env sh
# ##############################################################################
# notes
# ******************************************************************************
# purpose: setup a basic environment with all the tools
# ******************************************************************************
# main
# ******************************************************************************
# install all desired packages
# ==============================================================================
# apt packages
sudo apt install -y wget curl vim python3 fzf ripgrep tmux

#create scratch dir and cd into it
mkdir ~/scratch && cd ~/scratch

# install starship
curl -sS https://starship.rs/install.sh | sh

# install zoxide
wget https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.2/zoxide_0.9.2_amd64.deb
sudo apt install ./zoxide_0.9.2_amd64.deb

# configure bashrc
wget -P ~/.bashrc https://github.com/rowhit/ry__env_setup__20231204/blob/main/bashrc

# configure tmux
wget -P ~/.tmux.conf https://github.com/rowhit/ry__env_setup__20231204/blob/main/tmux.conf

# configure starship
mkdir -p ~/.config
wget -P ~/.config/starship.toml https://github.com/rowhit/ry__env_setup__20231204/blob/main/starship.toml


# ##############################################################################
