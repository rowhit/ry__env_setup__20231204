#!/usr/bin/env sh
# file: script__ry__environment_setup__install_pkgs__20231204.sh
# ##############################################################################
# ** notes
# ******************************************************************************
# purpose: setup a basic environment with all the tools
# run as user: root


# ******************************************************************************
# vars
# ******************************************************************************
zoxide_version="0.9.2"
starship_version="1.17.1"
download_url="https://raw.githubusercontent.com/rowhit/ry__env_setup__20231204/main"


# ******************************************************************************
# ** main
# ******************************************************************************
# *** install packages
# ==============================================================================
# **** apt packages
apt install -y wget curl vim python3 fzf ripgrep tmux zip

# **** create scratch dir and cd into it
mkdir -p /root/scratch && cd /root/scratch

# **** install starship
# curl -sS https://starship.rs/install.sh | sh
wget https://github.com/starship/starship/releases/download/v${starship_version}/starship-x86_64-unknown-linux-gnu.tar.gz
tar xvzf ./starship-x86_64-unknown-linux-gnu.tar.gz
chmod +x ./starship
mv ./starship /usr/local/bin/.

# **** install zoxide
wget https://github.com/ajeetdsouza/zoxide/releases/download/v${zoxide_version}/zoxide_${zoxide_version}_amd64.deb
apt install ./zoxide_${zoxide_version}_amd64.deb


# ##############################################################################
