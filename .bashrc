# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export VIRTUAL=nvim
export AWS_PROFILE=firedex-dev
export KUBECONFIG=~/.kube/config

PATH="$PATH:~/go/bin/:/usr/lib/ccache/bin:~/.cargo/bin"

stty -ixon # Disable ctrl-s and ctrl-q (which locks your prompt)
shopt -s autocd # navigate to directory without cd
shopt -s direxpand # TRYING
set -o vi # vi mode
bind -x '"\C-l":clear' # c-l breaks in vi mode

shopt -s histappend # save and reload the history after the execution of each command
PROMPT_COMMAND="history -a; history -n;" # 
HISTSIZE= HISTFILESIZE= # unlimited history
HISTCONTROL=erasedups:ignoreboth
HISTIGNORE="!(+(*\ *)):history:pwd"
HISTTIMEFORMAT="%m/%d - %H:%M:%S: "
 
alias p="sudo pacman"
alias v='$EDITOR'
alias n='$EDITOR'
alias vim='$EDITOR'
alias wifi='nmtui'
alias dot="cd ~/dots"

alias eza='eza --group-directories-first --icons'
alias l='eza -x'
alias la='eza -xa'
alias ls='eza -a1'
alias ll='eza -l'
alias lt='eza -a --tree --level=1'
alias ltt='eza -a --tree --level=2'

alias shutdown='systemctl poweroff'

alias ..='cd ..'
alias ...="cd ../../"
alias ....="cd ../../.."

alias z=zoxide # not really using

alias t='task'
alias ta='task add'

alias sb='source ~/.bashrc'
alias br='bazel run'

alias kubectl='kubecolor'
alias k='kubectl'
alias kg='kubectl get'
alias k9='k9s'
alias k9s='k9s -A'

alias fd='cd ~/fd/fireex/'
alias c="xclip -selection clipboard"

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
alias gw="git worktree"
alias gwl="git worktree list"
alias gwrm="git worktree remove"

alias xra="xrandr --auto"
alias xrd="xrandr --output eDP-1 --auto --output DP-3 --auto --left-of eDP-1 --primary"
alias xrt="xrandr --output eDP-1 --auto --output DP-3 --auto --left-of eDP-1 --primary --output HDMI-1 --auto --above DP-3"

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

function a() {
    alias | grep "$1"
}

# _kg()
# {
#     __kubectl_init_completion || return
#     return 0
# }
#
# complete -F _kg kg

. <(eksctl completion bash)
complete -C '/usr/local/bin/aws_completer' aws

source ~/.fzf.bash
# source ~/dots/complete_alias
# complete -F _complete_alias k


#complete -o default -F __start_kubectl k
#complete -o default -o nospace -F __start_kubectl k
source <(kubectl completion bash | sed 's/kubectl/k/g')
#complete -F _complete_alias "${!BASH_ALIASES[@]}"

eval "$(starship init bash)" # needs to be at the end
