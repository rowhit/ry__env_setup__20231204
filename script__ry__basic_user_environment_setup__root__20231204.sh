#!/usr/bin/env sh
# ##############################################################################
# notes
# ******************************************************************************
# purpose: setup a basic environment with all the tools
# run as user: root


# ******************************************************************************
# vars
# ******************************************************************************
zoxide_version="0.9.2"


# ******************************************************************************
# main
# ******************************************************************************
# install all desired packages
# ==============================================================================
# apt packages
apt install -y wget curl vim python3 fzf ripgrep tmux

#create scratch dir and cd into it
mkdir -p /root/scratch && cd /root/scratch

# install starship
curl -sS https://starship.rs/install.sh | sh

# install zoxide
wget https://github.com/ajeetdsouza/zoxide/releases/download/v${zoxide_version}/zoxide_${zoxide_version}_amd64.deb
apt install ./zoxide_${zoxide_version}_amd64.deb

download_url="https://raw.githubusercontent.com/rowhit/ry__env_setup__20231204/main"
# configure bashrc
wget -O ~/.bashrc ${download_url}/bashrc

# configure tmux
wget -O ~/.tmux.conf ${download_url}/tmux.conf

# configure starship
mkdir -p ~/.config
wget -O ~/.config/starship.toml ${download_url}/starship.toml


# ##############################################################################
