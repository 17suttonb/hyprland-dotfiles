# General
alias nf neofetch
alias ff fastfetch
alias uf uwufetch

# CLI Utility
alias ls 'eza --color=always --group-directories-first --icons'
alias ll 'eza -l --color=always --group-directories-first --icons --git --time-style=long-iso'
alias la 'eza -a --color=always --group-directories-first --icons'
alias l 'eza -lah --color=always --group-directories-first --icons --git --time-style=long-iso'
alias lt 'eza -aT --color=always --group-directories-first --icons'
alias l. 'eza -a | grep -E "^\."'
alias q exit
alias h history
alias c clear
alias reload 'source ~/.config/fish/config.fish'

# Navigation
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# Git
alias gs 'git status'
alias ga 'git add'
alias gc 'git commit'
alias gcl 'git clone'
alias gl 'git log --oneline'
alias gd 'git diff'
alias gpush 'git push'
alias gpull 'git pull'

# System
alias wifi nmtui
alias install 'yay -S'
alias update 'yay -Syu'
alias search 'yay -Ss'
alias lsearch 'yay -Qs'
alias remove 'yay -Rns'
alias update-grub 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias shutdown 'systemctl poweroff'
alias du dust

function backup
    sudo timeshift --create --comments "archbtw-backup-(date +%Y%m%d)"
end

set -x SHELL_CONFIG_DIR $HOME/.config

# Go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

# Cargo
set -x CARGO_HOME $HOME/.cargo
set -x PATH $CARGO_HOME/bin $PATH

# NVM
set -x NVM_DIR $HOME/.nvm

# Android / Flutter
set -x ANDROID_HOME $HOME/Android
set -x ANDROID_SDK_ROOT $ANDROID_HOME/sdk
set -x PATH $ANDROID_SDK_ROOT/cmdline-tools/latest/bin $PATH
set -x PATH $ANDROID_SDK_ROOT/platform-tools $PATH

set -x FLUTTER_HOME $ANDROID_HOME/flutter
set -x PATH $FLUTTER_HOME/bin $PATH

set -x CHROME_EXECUTABLE /usr/bin/google-chrome-stable

function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

function extract
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xvf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z x $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end

# fisher install jorgebucaran/nvm.fish
