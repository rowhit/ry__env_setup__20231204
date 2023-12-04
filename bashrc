# file: bashrc
# author: Rohit Yadav
################################################################################
# global variables
#*******************************************************************************
# whitespace4='    '
# projects_dir_path="/data/projects"
# projects_by_uuid_dir_path="/data/projects/by-uuid"
# projects_by_name_dir_path="/data/projects/by-name"

#*******************************************************************************
# terminal
#*******************************************************************************
# setterm -linewrap off

#*******************************************************************************
# files
#*******************************************************************************
# files/functions
# ==============================================================================
# load file if exists
file-load-if-exists() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

load-file-if-exists() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

# rename a file name to lowercase
file-rename-to-lower-case() { rename 's/(.*)\/([^\/]*)/$1\/\L$2/'; }
rename-file-to-lower-case() { rename 's/(.*)\/([^\/]*)/$1\/\L$2/'; }

# remove file that matches pattern
file-rm-match-pattern() { find . -type f -name $1 -exec rm {} +; }

# ==============================================================================
# files/aliases
# ==============================================================================
# list files
alias ls='ls --color'
alias sl='ls --color'
alias lsg='ls | grep -i'

# list based on type
alias la='ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep "^l"'
alias l='ls -lh'
alias ld='ls -lh | grep "^d"'
alias lf='ls -lh | grep "^-"'
alias ll='ls -lh | grep "^l"'

alias l.='ls -dlh .* | grep "^d" && ls -dlh .* | grep "^-" && ls -dlh .* | grep "^l"'
alias ld.='ls -dlh .* | grep "^d"'
alias lf.='ls -dlh .* | grep "^-"'
alias ll.='ls -dlh .* | grep "^l"'

alias lsof='lsof -p'
#*******************************************************************************
# timestamps
#*******************************************************************************
# timestamp=$(date -d "today" +"%Y_%m_%d:%H:%M")
timestamp-gen() {
    echo $(date -d 'today' +'%Y_%m_%d__%H_%M')
    echo $(date -d 'today' +'%Y%m%d_%H%M')
    echo $(date -d 'today' +'%Y%m%d')
}


#*******************************************************************************
# aliases | unix utils
#*******************************************************************************
# screen/terminal
alias cls='clear'
alias c='clear'

# history
alias h='history'
alias histg='history | grep'
alias pd='pushd'
alias po='popd'

# grep
alias grep='grep --color=auto'

# exit
alias x='exit'

# copy
alias cp='cp --verbose'

# move
alias mv='mv --verbose'

# mkdir
alias mkdir='mkdir -pv'

# wget
alias wget='wget -c'

# top, htop
if command -v htop &>/dev/null; then alias top='htop'; fi

# remove, delete
alias rf='rm -rf'
alias rm_force_sudo='sudo rm -R'

#alias make='make -j4'
# alias xterm='xterm -fa "Monospace" -fs 11'
alias xterm='xterm -fa "Monospace" -fs 13 -bg black -fg gray'
alias meaning="sdcv"
# alias xterm='xterm -fa "terminus" -fs 14 -bg black -fg gray'
#*******************************************************************************
# aliases | disk
#*******************************************************************************
alias df='df -Tha --total'
# alias df='pydf'
alias du='du -ach | sort -h'
# alias du='ncdu'
#*******************************************************************************
# aliases | ram
#*******************************************************************************
alias free='free -mt'
alias fhere='find . -name -print'
# alias find-rowhit='find ${PWD} -maxdepth 0 -print -name;'
# find-rowhit(){ find $PWD -maxdepth 0 -name $1 -print; }
tree-rowhit() { find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'; }

## FILE DISPLAY
alias more='less -M'
alias ccat='pygmentize -O style=monokai -f console256 -g'

#*******************************************************************************
# backup files and folders
#*******************************************************************************
backup() {
    fileName=${@%/}
    if [ -f "$fileName" ]; then
        cp "$fileName" "$fileName__snapshot__$(date -d 'today'+'%Y%m%d%H%M%s')"
    fi
    if [ -d $fileName ]; then
        tar cvzf $fileName.tgz $fileName
        mv $fileName.tgz $fileName$(date -d "today" +"_%Y%m%d%H%M%s").tgz
    fi
}
#*******************************************************************************
# function | compress/extraction | general purpose
#*******************************************************************************
extract() {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f "$1" ]; then
            # NAME=${1%.*}
            # mkdir $NAME && cd $NAME
            case "$1" in
            *.tar.bz2) tar xvjf "$1" ;;
            *.tar.gz) tar xvzf "$1" ;;
            *.tar.xz) tar xvJf "$1" ;;
            *.lzma) unlzma "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x -ad "$1" ;;
            *.gz) gunzip "$1" ;;
            *.tar) tar xvf "$1" ;;
            *.tbz2) tar xvjf "$1" ;;
            *.tgz) tar xvzf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *.7z) 7z x "$1" ;;
            *.xz) unxz "$1" ;;
            *.exe) cabextract "$1" ;;
            *) echo "extract: $1 - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}
#*******************************************************************************
# password gen
#*******************************************************************************
# randpw(){ < /dev/urandom tr -dc _A-Z-a-z1-9 | head -c${1:-32}; echo; }
randpw() {
    tr </dev/urandom -dc '1234567890!@$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c"$1"
    echo ""
}

# randpw-global-foundry() {
#     tr </dev/urandom -dc '1234567890!@$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c"$1"
#     echo ""
# }
#*******************************************************************************
# man packages
#*******************************************************************************
manpages() {
    find $(echo "$MANPATH" | tr ':' ' ') -path '*/man2/*'
}

#*******************************************************************************
# unix toolkit
#*******************************************************************************
ry-utk-lock() { gnome-screensaver-command -l; }
#*******************************************************************************
# emacs
#*******************************************************************************
# emacs | functions | create new server
#===============================================================================
# emacs-daemon-create() { env TMPDIR="$HOME/.config/emacs/socket/$(hostname)" emacs --daemon="$1"; }
emacs-daemon-create() { emacs --daemon="$1"; }
#===============================================================================
# emacs | function | search running emacs servers
#===============================================================================
emacs-daemon-search() {
    if command -v procs &>/dev/null; then
        procs -a emacs daemon "$USER" | grep "$1"
    else
        ps aux -u "$USER" | grep "emacs" | grep "daemon" | grep "$1"
    fi
}
#===============================================================================
# emacs | function | list servers
#===============================================================================
emacs-daemon-list() {
    if command -v procs &>/dev/null; then
        procs -a emacs daemon "$USER"
    else
        ps aux -u "$USER" | grep "emacs" | grep "daemon"
    fi
}
emacs-daemon-connect() { emacsclient --socket="$1" --create-frame -nw; }
emacs-daemon-connect-gui() { emacsclient --socket="$1" --create-frame -no-wait; }

#*******************************************************************************
# starship
# alternative to bashit
#*******************************************************************************
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

#*******************************************************************************
# tmux
#*******************************************************************************
# tmux/alias
#===============================================================================
if command -v tmux &>/dev/null; then
    alias tmux-new="tmux new -s"
    alias tmux-create="tmux new-session -d -s"
    alias tmux-attach=" tmux new -A -s "
    alias tmux-list="tmux list-sessions"
    alias tmux-search="tmux list-sessions | grep"
    alias tmux-kill="tmux kill-session -t"
    alias tmux-kill-all="tmux kill-server"
fi

#*******************************************************************************
# path.home.bin
#*******************************************************************************
if [ -d "${HOME}/bin" ]; then export PATH="$PATH:${HOME}/bin"; fi
if [ -d "${HOME}/.local/bin" ]; then export PATH="$PATH:${HOME}/.local/bin"; fi

#*******************************************************************************
# editor | vim/nvim
#*******************************************************************************
if command -v nvim &>/dev/null; then
    alias vim='nvim'
    alias _vim='/usr/bin/vim'
    export EDITOR="nvim"
else 
    export EDITOR="vim"
fi

#*******************************************************************************
# lxc
#*******************************************************************************
if command -v lxc &>/dev/null; then

    # lxc/functions
    lxc-shell-root() { lxc exec ${1} bash; }
    lxc-shell-ubuntu() { lxc exec ${1} -- su --login ubuntu; }

    # lxc/aliases
    alias lxc-list='lxc list -c nds4'
    alias lxc-list-short='lxc list -c ns4t'
    alias lxc-list-detail='lxc list -c ndts4acP'
    alias lxc-list-vulcan='lxc list -c nds4 | grep -i vulcan'
    alias lxc-list-blumind='lxc list -c nds4 | grep -i blumind'

    # lxc/x1
    alias x1-ubuntu='lxc exec x1 -- su --login ubuntu'
    alias x1-root='lxc exec x1 bash'


fi

#*******************************************************************************
# direnv
#*******************************************************************************
if command -v direnv &>/dev/null; then
    eval "$(direnv hook bash)"
fi
#*******************************************************************************
# snakemake
#*******************************************************************************
alias snake='snakemake'
alias s='snakemake -c8'

#*******************************************************************************
# kubernetes
#*******************************************************************************
if command -v kubectl &>/dev/null; then
    # alias kg='kubectl get'
    # alias kgs='kubectl get services'
    # alias kgsa='kubectl get services --all-namespace'
    # alias kgp='kubectl get pods'
    # alias kgd='kubectl get deployments'
    alias kc='kubectl'
    alias kx='kubectx'
    alias kn='kubens'
    export KUBECONFIG="${HOME}/.config/k8/kubeconfig.yaml"
fi
#*******************************************************************************
# k3d
#*******************************************************************************
# source ~/.bashrc.k3d.completion
#*******************************************************************************
# navi
#*******************************************************************************
if command -v navi &>/dev/null; then
    alias n='navi'
fi
#*******************************************************************************
# ripgrep
#*******************************************************************************
if command -v rg &>/dev/null; then
    alias rg='rg --color always --ignore-case'
else
    alias rg='grep -i --color'
fi

#*******************************************************************************
# fzf: fuzzy finder
#*******************************************************************************
if command -v fzf &>/dev/null; then
    alias f="fzf"
    if [ -f ~/.fzf.bash ]; then
        source ~/.fzf.bash
    fi

    # reverse search
    # CTRL-/ to toggle small preview window to see the full command
    # CTRL-Y to copy the command into clipboard using pbcopy
    export FZF_CTRL_R_OPTS="
        --preview 'echo {}' --preview-window up:3:hidden:wrap
        --bind 'ctrl-/:toggle-preview'
        --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
        --color header:italic
        --header 'Press CTRL-Y to copy command into clipboard'"

    # Print tree structure in the preview window
    export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi
#*******************************************************************************
# zoxide
#*******************************************************************************
if command -v zoxide &>/dev/null; then
    export _ZO_ECHO=1
    # export _ZO_EXCLUDE_DIRS=$HOME:/lib
    export _ZO_FZF_OPTS='--height 40% --layout=reverse --border'
    eval "$(zoxide init --cmd z --hook pwd bash)"
    # alias z="zoxide"
    alias za="zoxide add"
fi

#*******************************************************************************
# XDG settings
#*******************************************************************************
if [ -d "$HOME/.local/share" ]; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi

if [ -d "$HOME/.config" ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -d "$HOME/.local/state" ]; then
    export XDG_STATE_HOME="$HOME/.local/state"
fi

if [ -d "$HOME/.cache" ]; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

#*******************************************************************************
# editor | nano
#*******************************************************************************
alias nano='sudo nano -iSw$'

#*******************************************************************************
# encryption
#*******************************************************************************
# alias gpg='gpg2'
encrypt-ssl() { openssl aes-256-cbc -salt -in $1 -out $2; }
decrypt-ssl() { openssl aes-256-cbc -d -in $1 -out $2; }

#*******************************************************************************
# linux process
#*******************************************************************************
ps_pid_get_match() { ps -ef | grep -w $1 | awk 'NR==1{print $2}'; }
ps_pid_kill_match() { kill $(ps -ef | grep -w $1 | awk 'NR==1{print $2}'); }

# alias ps='ps auxwf '
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psc='ps xawf -eo pid,user,cgroup,args'
alias get_pid='pgrep -f'

#*******************************************************************************
# icewm
#*******************************************************************************
if command -v icewm &>/dev/null; then
    alias icewm_reload="icewm --restart"
    alias icewm_restart="icewm --replace"
fi

#*******************************************************************************
# cat, bat
#*******************************************************************************
if command -v bat &>/dev/null; then
    alias cat='bat'
    alias _cat='/usr/bin/cat'
fi

#*******************************************************************************
# LC_ALL
#*******************************************************************************
export LC_ALL="en_US.UTF-8"

#*******************************************************************************
# mkdir-timestamp
#*******************************************************************************
mkdir-timestamp() {
    timestamp=$(date +%Y%m%d_%H%M)
    mkdir ${timestamp}
}

################################################################################
