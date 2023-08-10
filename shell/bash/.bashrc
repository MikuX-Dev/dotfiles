#
# ~/.bashrc
#

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Check if running interactively
case $- in
*i*) ;;
*) return ;;
esac

# History settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Bash can automatically prepend cd when entering just a path in the shell. For example:
shopt -s autocd

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
#alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# exports
export LD_PRELOAD=""
export EDITOR="/usr/bin/nvim"
export GIT_PS1_SHOWDIRTYSTATE=1
export PATH="/home/abi/.local/bin:$PATH"
export PATH="/home/abi/.cargo/bin:$PATH"
export PATH="${HOME}/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:"
export PATH="${PATH}/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:"

# Source
source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/git-prompt.sh

# Custom shell stolen from blackarch
export PS1='\[\033[0;34m\]\[\033[1m\][\[\033[0m\]\[\033[0;36m\]\u\[\033[0;90m\]\[\033[1m\]\[\033[0;90m\]@\[\033[0m\]\[\033[0;36m\]\h\[\033[0;34m\]\[\033[1m\]]-\[\033[0m\]\[\033[0;34m\]\[\033[1m\][\[\033[0m\]\[\033[1;37m\]\w$(__git_ps1 " (%s)")\[\033[0;34m\]\[\033[1m\]\[\033[0m\]\[\033[0;34m\]\[\033[1m\]]\[\033[0m\]\n\[\033[0;34m\]\[\033[1m\]>>>\[\033[0m\]\[\033[0m\] '

#export PS1='\[\033[0;34m\][\[\033[0m\]\[\033[0;36m\]\u\[\033[0;90m\]@\[\033[0m\]\[\033[0;36m\]\h\[\033[0;34m\]]-[\[\033[0m\]\[\033[1;37m\]\w$(__git_ps1 "\[\0330;34m\]-(%s)")\[\0330;34m\]]\n\[\0330;34m\]>>>\[\033[0m\] '

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Colours have names too. Stolen from Arch wiki
Nblack="\[\033[0;30m\]"
NRed="\[\033[0;31m\]"
NGreen="\[\033[0;32m\]"
NYellow="\[\033[0;33m\]"
NBlue="\[\033[0;34m\]"
NPurple="\[\033[0;35m\]"
NCyan="\[\033[0;36m\]"
NWhite="\[\033[0;37m\]"

BBlack="\[\033[1;30m\]"
BRed="\[\033[1;31m\]"
BGreen="\[\033[1;32m\]"
BYellow="\[\033[1;33m\]"
BBlue="\[\033[1;34m\]"
BPurple="\[\033[1;35m\]"
BCyan="\[\033[1;36m\]"
BWhite="\[\033[1;37m\]"

LBlack="\[\033[0;90m\]"
LRed="\[\033[0;91m\]"
LGreen="\[\033[0;92m\]"
LYellow="\[\033[0;93m\]"
LBlue="\[\033[0;94m\]"
LPurple="\[\033[0;95m\]"
LCyan="\[\033[0;96m\]"
LWhite="\[\033[0;97m\]"

BLBlack="\[\033[1;90m\]"
BLRed="\[\033[1;91m\]"
BLGreen="\[\033[1;92m\]"
BLYellow="\[\033[1;93m\]"
BLBlue="\[\033[1;94m\]"
BLPurple="\[\033[1;95m\]"
BLCyan="\[\033[1;96m\]"
BLWhite="\[\033[1;97m\]"

# Use bash-completion, if available
[[ $PS1 && -r /usr/share/bash-completions/completions ]] &&
	. /usr/share/bash-completion/completions/*
