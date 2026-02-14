
###############################
# ~/.bashrc — Starter Template
###############################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#########################################
# 1. COLORS
#########################################
# Color codes
RED="\[\e[31m\]"
GRN="\[\e[32m\]"
YEL="\[\e[33m\]"
BLU="\[\e[34m\]"
MAG="\[\e[35m\]"
CYN="\[\e[36m\]"
RST="\[\e[0m\]"

#########################################
# 2. GIT BRANCH FUNCTION
#########################################
parse_git_branch() {
    git branch 2>/dev/null | sed -n 's/* \(.*\)/(\1)/p'
}

#########################################
# 3. PROMPT (PS1)
# Shows: username@host:folder (gitbranch) $
#########################################
export PS1="${RED}\u${RST}@${MAG}\h${RST}:${CYN}\w${BLU}\$(parse_git_branch)${RST}\$ "

#########################################
# 4. ALIASES
#########################################
# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listing
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Git shortcuts
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'

#########################################
# 5. PATH ADDITIONS
#########################################
# Example: add ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

#########################################
# 6. History Behavior
#########################################
export HISTSIZE=50000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

#########################################
# 7. Autocomplete + Syntax Highlighting
#########################################
# If bash-completion is installed
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Optional: enable bash syntax highlighting if installed
if [ -f /usr/share/bash-syntax-highlighting/syntax-highlighting.sh ]; then
    source /usr/share/bash-syntax-highlighting/syntax-highlighting.sh
fi

#########################################
# 8. Custom Functions
#########################################
mkcd() { mkdir -p "$1" && cd "$1"; }

extract() {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"   ;;
            *.tar.gz)    tar xzf "$1"   ;;
            *.bz2)       bunzip2 "$1"   ;;
            *.rar)       unrar x "$1"   ;;
            *.gz)        gunzip "$1"    ;;
            *.tar)       tar xf "$1"    ;;
            *.tbz2)      tar xjf "$1"   ;;
            *.tgz)       tar xzf "$1"   ;;
            *.zip)       unzip "$1"     ;;
            *.Z)         uncompress "$1";;
            *.7z)        7z x "$1"      ;;
            *)           echo "Unknown file type" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

#########################################
# 9. Final Message
#########################################
echo -e "${CYN}✔ Custom BashRC Loaded${RST}"

