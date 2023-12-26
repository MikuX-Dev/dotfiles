# exec on open terminal
~/bin/random_script_runner.sh
#~/bin/fastestmirror.sh
#echo "Wait, Getting the fastest mirror!"

# Load starship prompt if starship is installed
if [ -x /usr/bin/starship ]; then
  __main() {
    local major="${BASH_VERSINFO[0]}"
    local minor="${BASH_VERSINFO[1]}"

    if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
      source <("/usr/bin/starship" init bash --print-full-init)
    else
      source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
    fi
  }
  __main
  unset -f __main
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="powerlevel10k"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# enable completion features

autoload -Uz compinit
compinit -d ~/.cache/zcompdump
autoload bashcompinit
bashcompinit
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

setopt autocd # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# configure key keybindings
bindkey -e                                     # emacs key bindings
bindkey ' ' magic-space                        # do history expansion on space
bindkey '^U' backward-kill-line                # ctrl + U
bindkey '^[[3;5~' kill-word                    # ctrl + Supr
bindkey '^[[3~' delete-char                    # delete
bindkey '^[[1;5C' forward-word                 # ctrl + ->
bindkey '^[[1;5D' backward-word                # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history # page up
bindkey '^[[6~' end-of-buffer-or-history       # page down
bindkey '^[[H' beginning-of-line               # home
bindkey '^[[F' end-of-line                     # end
bindkey '^[[Z' undo                            # shift + tab undo last action

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-syntax-highlighting
  sudo
)

# User configuration

# Source
source $ZSH/oh-my-zsh.sh

# Path
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/nvim/mason/bin:$HOME/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -e /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if ((zshcache_time < paccache_time)); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# Alias;
# File Management:
alias cp="cp -iv" # confirm before overwriting something
alias rm="rm -iv"
alias mv="mv -iv"
alias df="df -h" # human-readable sizes
alias du="du -h"
# alias cat="batcat"

# Directory Operations:
alias cd..="cd ../"
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# System Info:
alias free="free -h"

# Listing Files:
# alias ll="ls -al"
# alias la="ls --color=auto"
# alias ls="ls --color=auto"
# alias sl="ls --color=auto"
# alias l="ls -ahls --color=auto"
# alias ls='exa -l --colour always --icons'
# alias sl='exa -l --colour always --icons'
# alias la='exa -la --colour always --icons'
# alias l='exa --colour always --group-directories-first -l --all --icons'
# alias ll='exa --colour always --group-directories-first -l --all --icons'
# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons'     # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'      # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'      # long format
alias lt='exa -aT --color=always --group-directories-first --icons'     # tree listing
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Text Editors:
alias vim="vim"
alias svim='sudo vim'
alias nv="nvim"
alias snv="sudo nvim"
# alias he="helix"
# alias she="sudo helix"
alias edit="gedit"
alias sedit="sudo gedit"

# File Browsing:
alias files="ranger"

# Network Operations:
alias curl="curl --user-agent 'noleak'"
alias wget="wget -c --user-agent 'noleak'"

# Disk Management:
alias shred="shred -zf"

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
alias gc="git commit -m "
alias ga="git add"
alias gpl="git pull"
alias gpom="git pull origin master"
alias gpu="git push"
alias gpuom="git push origin master"
alias gd="git diff"
alias gch="git checkout"
alias gnb="git checkout -b"
alias gac="git add . && git commit -m"
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
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfa='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add'
alias dfc='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit'
alias dfp='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push'

# Miscellaneous:
alias c="clear"
alias q="exit"

# Application
# alias code="codium" # vscodium

# Working directory:
alias work="cd ~/Data-Linux/work"
alias data="cd ~/Data-Linux/"
# alias gh="cd ~/desktop/work/github"
# alias gl="cd ~/desktop/work/gitlab"

alias update='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upall='sudo pacman -Syyu; yay -Syu'
alias upal='sudo pacman -Syyu; yay -Syu'

alias updatemirror='sudo reflector -f 10 --download-timeout 25 -l 10 -a 10 -p https --sort rate --save /etc/pacman.d/mirrorlist'

alias cleancache='yes | yay -Scc'

alias poeweroff='sudo poeweroff'
alias reboot='sudo reboot'

# Color for exa
export EXA_COLORS="\
uu=36:\
gu=37:\
sn=32:\
sb=32:\
da=34:\
ur=34:\
uw=35:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:"

# Functions
# Function to extract various types of archives
ex() {
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz) tar xzf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) unrar x $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xf $1 ;;
    *.tbz2) tar xjf $1 ;;
    *.tgz) tar xzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *.deb) ar x $1 ;;
    *.tar.xz) tar xf $1 ;;
    *.tar.zst) tar xf $1 ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

netinfo() {
  # Display network interface information
  echo "---------- Network Interfaces ----------"
  ip -brief link show

  # Display IP address information
  echo "---------- IP Addresses ----------"
  ip -brief addr show

  # Display DNS settings
  echo "---------- DNS Settings ----------"
  grep nameserver /etc/resolv.conf

  # Display network connections
  echo "---------- Network Connections ----------"
  ss -tunap

  Display firewall settings
  echo "---------- Firewall Settings ----------"
  sudo iptables -L -v

  echo "----------"
}

whatsmyip() {
  echo "Fetching your external IP address..."
  external_ip=$(curl -s https://api64.ipify.org?format=text)
  if [ -n "$external_ip" ]; then
    echo "Your external IP address is: $external_ip"
  else
    echo "Unable to retrieve external IP address."
  fi
}

fontupdate() {
  # Download and install nerd-fonts
  fonts_url="https://github.com/ryanoasis/nerd-fonts/releases/latest"
  font_files=("CascadiaCode.tar.xz" "Noto.tar.xz" "JetBrainsMono.tar.xz" "Meslo.tar.xz" "RobotoMono.tar.xz")
  font_file_names=("CascadiaCode" "Noto" "JetBrainsMono" "Meslo" "RobotoMono")
  for ((i = 0; i < ${#font_files[@]}; i++)); do
    font_file=${font_files[i]}
    font_name=${font_file_names[i]}
    font_url=$(curl -sL ${fonts_url} | grep -o -E "https://.*${font_file}")
    # Create a folder with the font name
    mkdir -p "${font_name}"
    # Download and extract the font
    curl -L -o "${font_file}" "${font_url}"
    tar -xvf "${font_file}" -C "${font_name}"
    rm "${font_file}"
    # Move the font folder to /usr/share/fonts/
    mv "${font_name}" /usr/share/fonts/
  done
  # Update font cache
  fc-cache -f -v
  echo "Update complete."
}

### This should be in the last
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
