#!/usr/bin/env sh
# ##############################################################################
# notes
# ******************************************************************************
# purpose: setup a basic environment with all the tools
# run as user: ubuntu


# ******************************************************************************
# vars
# ******************************************************************************


# ******************************************************************************
# main
# ******************************************************************************
# install all desired packages
# ==============================================================================

download_url="https://raw.githubusercontent.com/rowhit/ry__env_setup__20231204/main"
# configure bashrc
wget -O ~/.bashrc ${download_url}/bashrc

# configure tmux
wget -O ~/.tmux.conf ${download_url}/tmux.conf

# configure starship
mkdir -p ~/.config
wget -O ~/.config/starship.toml ${download_url}/starship.toml


# ##############################################################################
