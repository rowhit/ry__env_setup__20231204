#!/usr/bin/env sh
# * file: script__ry__basic_user_environment_setup__ubuntu__20231204.sh
# ##############################################################################
# ** notes
# ******************************************************************************
# purpose: setup a basic environment with all the tools
# run as user: ubuntu


# ******************************************************************************
# ** vars
# ******************************************************************************
download_url="https://raw.githubusercontent.com/rowhit/ry__env_setup__20231204/main"


# ******************************************************************************
# ** main
# ******************************************************************************
# *** configure bashrc
wget -O ~/.bashrc ${download_url}/bashrc

# *** configure tmux
wget -O ~/.tmux.conf ${download_url}/tmux.conf

# *** configure starship
mkdir -p ~/.config
wget -O ~/.config/starship.toml ${download_url}/starship.toml

# *** configure starship
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

wget -O ~/.vimrc ${download_url}/vimrc



# ##############################################################################
