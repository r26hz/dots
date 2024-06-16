#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# 
# by Stephan Raabe (2023)
# -----------------------------------------------------
# ~/.bashrc
# -----------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Define Editor
export EDITOR=nvim
export VISUAL=nvim

set -o vi

# c-l breaks in vi mode
bind -x '"\C-l":clear'


# history

export HISTCONTROL=ignoreboth
shopt -s histappend

# save and reload the history after the execution of each command
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# AWS
complete -C '/usr/local/bin/aws_completer' aws
 
# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

alias c='clear'
alias nf='neofetch'
alias pf='pfetch'
alias l='eza --icons'
alias l1='eza -1 --icons'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias shutdown='systemctl poweroff'
alias v='$EDITOR'
alias n='$EDITOR'
alias vim='$EDITOR'
alias ts='~/dotfiles/scripts/snapshot.sh'
alias matrix='cmatrix'
alias wifi='nmtui'
alias od='~/private/onedrive.sh'
alias rw='~/dotfiles/waybar/reload.sh'
alias winclass="xprop | grep 'CLASS'"
alias dot="cd ~/dotfiles"
alias cleanup='~/dotfiles/scripts/cleanup.sh'


# new alias
# TaskWarrior
alias t='task'
alias ta='task add'

alias sb='source ~/.bashrc'

# -----------------------------------------------------
# ML4W Apps
# -----------------------------------------------------
alias ml4w='~/dotfiles/apps/ML4W_Welcome-x86_64.AppImage'
alias ml4w-settings='~/dotfiles/apps/ML4W_Dotfiles_Settings-x86_64.AppImage'
alias ml4w-sidebar='~/dotfiles/eww/ml4w-sidebar/launch.sh'
alias ml4w-hyprland='~/dotfiles/apps/ML4W_Hyprland_Settings-x86_64.AppImage'
alias ml4w-diagnosis='~/dotfiles/scripts/diagnosis.sh'

# -----------------------------------------------------
# Window Managers
# -----------------------------------------------------

alias Qtile='startx'
# Hyprland with Hyprland

# -----------------------------------------------------
# GIT
# -----------------------------------------------------

alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"

alias gl='git log --graph --decorate --all'
alias gll='gl --pretty=format:"%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s" --relative-date'
alias glll='gl --color --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset'\'' --abbrev-commit'


# -----------------------------------------------------
# SCRIPTS
# -----------------------------------------------------

alias gr='python ~/dotfiles/scripts/growthrate.py'
alias ChatGPT='python ~/mychatgpt/mychatgpt.py'
alias chat='python ~/mychatgpt/mychatgpt.py'
alias ascii='~/dotfiles/scripts/figlet.sh'

# -----------------------------------------------------
# VIRTUAL MACHINE
# -----------------------------------------------------

alias vm='~/private/launchvm.sh'
alias lg='~/dotfiles/scripts/looking-glass.sh'

# -----------------------------------------------------
# EDIT CONFIG FILES
# -----------------------------------------------------

alias confq='$EDITOR ~/dotfiles/qtile/config.py'
alias confp='$EDITOR ~/dotfiles/picom/picom.conf'
alias confb='$EDITOR ~/dotfiles/.bashrc'

# -----------------------------------------------------
# EDIT NOTES
# -----------------------------------------------------

alias notes='$EDITOR ~/notes.txt'

# -----------------------------------------------------
# SYSTEM
# -----------------------------------------------------

alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias setkb='setxkbmap de;echo "Keyboard set back to de."'

# -----------------------------------------------------
# SCREEN RESOLUTINS
# -----------------------------------------------------

# Qtile
alias res1='xrandr --output DisplayPort-0 --mode 2560x1440 --rate 120'
alias res2='xrandr --output DisplayPort-0 --mode 1920x1080 --rate 120'


# xrd alis
alias xra="xrandr --auto"
alias xrd="xrandr --output eDP-1 --auto --output DP-3 --auto --left-of eDP-1 --primary"
alias xrt="xrandr --output eDP-1 --auto --output DP-3 --auto --left-of eDP-1 --primary --output HDMI-1 --auto --above DP-3"


# source fzf
source ~/.fzf.bash

# eksctl bash completeion
. <(eksctl completion bash)


# person alias
alias z=zoxide

export PATH="/usr/lib/ccache/bin/:$PATH"

# ac function
function ac() {
    case "$1" in
	"prod" )
	    export AWS_PROFILE=firedex-prod ;;
	"stage" )
	    export AWS_PROFILE=firedex-staging ;;
	"staging" )
	    export AWS_PROFILE=firedex-staging ;;
	"dev" )
	    export AWS_PROFILE=firedex-dev ;;
    esac
}

# -----------------------------------------------------
# DEVELOPMENT
# -----------------------------------------------------
alias dotsync="~/dotfiles-versions/dotfiles/.dev/sync.sh dotfiles"

export AWS_PROFILE=firedex-dev
export KUBECONFIG=~/.kube/firedex-dev-kubeconfig.yml
# -----------------------------------------------------
# START STARSHIP
# -----------------------------------------------------
eval "$(starship init bash)"
