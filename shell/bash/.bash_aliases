# Alias;
# File Management:
alias cp="cp -iv" # confirm before overwriting something
alias rm="rm -iv"
alias mv="mv -iv"
alias df="df -h" # human-readable sizes
alias du="du -h"

# Directory Operations:
alias md="mkdir -p"
alias cd..="cd .."

# System Info:
alias free="free -h"

# Listing Files:
# alias ll="ls -al"
# alias la="ls -a"
# alias ls="ls --color=auto"
# alias sl="ls --color=auto"
# alias l="ls -ahls --color=auto"
alias ls='exa -l --colour always'
alias la='exa -l --colour always --all'
alias l='exa --color-scale --group-directories-first -l --all'
alias ll='exa --color-scale --group-directories-first -l --all'

# Text Editors:
#alias vi="vim"
#alias svi='sudo vim'
alias nv="nvim"
alias snv="sudo nvim"

# File Browsing:
alias files="ranger"

# Network Operations:
alias curl="curl --user-agent 'noleak'"
alias wget="wget -c --user-agent 'noleak'"

# Disk Management:
alias shred="shred -zf"

# sudo Operations:
alias smd="sudo mkdir"
alias snv="sudo nvim"

# DOS Commands:
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"

# Searching and Filtering:
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Version Control (Git):
alias g="git"
alias gst="git status"
alias gc="git commit"
alias ga="git add"
alias gpl="git pull"
alias gpom="git pull origin master"
alias gpu="git push"
alias gpuom="git push origin master"
alias gd="git diff"
alias gch="git checkout"
alias gnb="git checkout -b"
alias gac="git add . && git commit"
alias grs="git restore --staged ."
alias gre="git restore"
alias gr="git remote"
alias gcl="git clone"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gt="git ls-tree -r master --name-only"
alias grm="git remote"
alias gb="git branch"
alias gf="git fetch"

# Dotfiles Management (Assuming a specific directory setup):
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dfa='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add'
alias dfc='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit'
alias dfp='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME push'

# Miscellaneous:
alias c="clear"
alias q="exit"

# Application
alias code="vscodium"

# Working directory:
alias w="cd ~/desktop/work"
alias gh="cd ~/desktop/work/github"
alias gl="cd ~/desktop/work/gitlab"

# alias
#alias vi="nvim"
#alias shred="shred -zf"
#alias python="python2"
#alias wget="wget -U 'noleak'"
#alias curl="curl --user-agent 'noleak'"

