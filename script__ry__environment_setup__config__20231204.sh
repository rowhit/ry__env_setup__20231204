#!/usr/bin/env sh
# * file: script__ry__environment_setup__config__20231204.sh
# ##############################################################################
# ** notes
# ******************************************************************************
# purpose: setup a basic environment with all the tools for any user


# ******************************************************************************
# ** vars
# ******************************************************************************
download_url="https://raw.githubusercontent.com/rowhit/ry__env_setup__20231204/main"


# ******************************************************************************
# ** main
# ******************************************************************************
# **** create scratch dir and cd into it
mkdir -p /root/scratch && cd /root/scratch

# *** configure bashrc
wget -O ~/.bashrc ${download_url}/bashrc

# *** configure tmux
wget -O ~/.tmux.conf ${download_url}/tmux.conf
wget -O tmux.zip ${download_url}/tmux.zip
unzip tmux.zip && mv tmux ~/.tmux

# *** configure starship
mkdir -p ~/.config
wget -O ~/.config/starship.toml ${download_url}/starship.toml

# *** configure starship
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

wget -O ~/.vimrc ${download_url}/vimrc



# ##############################################################################
