# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Frees the Ctrl-s keyboard shortcut to enable forward search
# You can reverse this by running "stty ixon" (no minus)
stty -ixon

# Load in the git branch prompt script.
source ~/.git-prompt.sh

# Customize prompt with Git branch
export PS1='\[\e[1;31m\]\u\[\e[0m\] \[\e[1;32m\]\w\[\e[0m\]$(__git_ps1 " (%s)")\$ '
# Pokus s přidáním hranatých závorek -- funguje to?
# export PS1='\[[\e[1;31m\]\u\[\e[0m\]] \[\e[1;32m\]\w\[\e[0m\]$(__git_ps1 " (%s)")\$ '

# Customized prompt -- without Git branch
# export PS1='\[\e[1;31m\]\u\[\e[0m\] \[\e[1;32m\]\w\[\e[0m\]]$ '

# User specific aliases and functions
alias masinka='sl -al'

# new staging
alias rhstage="nice -n 15 rhpkg publican-build --lang en-US -m'Updated'"
alias rhtag="brew tag-pkg docs-rhel-6"

# for Publican 1.0+
alias pubtest="nice -n 15 publican build '--langs=en-US' --formats='test'"
alias pubsingle="nice -n 15 publican build '--langs=en-US' --formats='html-single'"
alias pubhtml="nice -n 15 publican build '--langs=en-US' --formats='html'"
alias pubhtmls="nice -n 15 publican build '--langs=en-US' --formats='html,html-single'"
alias pubdesk="nice -n 15 publican build '--langs=en-US' --formats='desktop'"
alias pubdesktop="nice -n 15 publican build '--langs=en-US' --formats='desktop'"
alias pubpdf="nice -n 15 publican build '--langs=en-US' --formats='pdf'"
alias pubepub="nice -n 15 publican build '--langs=en-US' --formats='epub'"
alias puball="nice -n 15 publican build '--langs=en-US' --formats='html-single,html,pdf'"
#alias pb="nice -n 15 publican build '--langs=en-US' --formats='html-single'"
#alias pt="publican build --langs=en-US --formats=test || notify-send 'PUBLICAN ERROR -- YOU SUCK'"
alias pb="publican clean ; publican build --langs=en-US --formats=html-single"
alias pt="publican clean ; publican build --langs=en-US --formats=test"
#alias pb='publican build --langs=en-US --formats=html-single; if [ $? -eq 0 ]; then notify-send EXCELLENT -- YOU ROCK; else notify-send ERROR -- YOU SUCK; fi'

alias cb="cd /home/milan/Repos/Internal/cubs; BZLINKS=1 ./cubs"

# xmllint -- provide the file, e.g. "xmllint /en-US/xml_tmp/Kerberos.xml"
# from swadaley -- useful for locating an error
alias xmllint="xmllint --dtdvalid http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"


alias tmpsingle="xdg-open /tmp/en-US/html-single/index.html"
alias tmpmulti="xdg-open /tmp/en-US/html/index.html"
alias tmpdesk="xdg-open /tmp/en-US/html-desktop/index.html"
alias tmppdf="xdg-open /tmp/en-US/pdf/*.pdf"

export tmpsingle="tmp/en-US/html-single/index.html"
export tmpmulti="tmp/en-US/html/index.html"
export tmpdesk="tmp/en-US/html-desktop/index.html"
export tmppdf="tmp/en-US/pdf/*.pdf"

alias pv='test -e tmp/en-US/html-single/index.html && firefox tmp/en-US/html-single/index.html || echo '\''Build it, dude.'\'' >&2'

# Commonly used directories shortcuts
alias buf="cd $HOME/Documents/buffer"
alias brc="vim $HOME/.bashrc"
alias sbrc="source $HOME/.bashrc"
alias ldi="cd $HOME/Repos/IdM/7-LDI_Guide"
alias idmsix="cd $HOME/Repos/IdM/6-IdM_Guide"
alias doc="cd $HOME/Documents"
alias repos="cd $HOME/Repos"
alias drop="cd $HOME/Dropbox"
alias down="cd $HOME/Downloads"
alias downtmp="cd $HOME/Downloads/temporary"
alias doctmp="cd $HOME/Documents/temporary"
alias doctest="cd $HOME/Documents/testing"

# Copy the output of a command to the system clipboard,
alias xclipc="xclip -selection c"

# alias for yum update
alias dup="sudo dnf update -y --disablerepo=eng-rhel-7"

# alias for googler -- site search access.redhat.com
# https://github.com/jarun/google-cli
alias site="googler -n 6 site:access.redhat.com"

# History
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=10000                    # big big history
export HISTFILESIZE=10000                # big big history
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# SSH
alias sshbrq="ssh mnavrati@file.brq.redhat.com"
SSHS="mnavrati@file.brq.redhat.com:public_html"
SSHPRIV="mnavrati@file.brq.redhat.com"

export EDITOR=vim
export VISUAL=gvim

#Shortcuts
alias kin="kinit mnavrati@REDHAT.COM"
alias g="gvim"
alias grs="gvim --remote-silent"
alias ls="ls -hvp --color=always --group-directories-first"
alias ll="ls -lhvp --color=always --group-directories-first"
alias la="ls -ahvp --color=always --group-directories-first"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias vm="vifm"

# Aliases for Git
alias ga="git add ."
alias gp="git push"
alias gl="git log"
alias gst="git status"
alias gd="git diff --word-diff=color"
alias glo="git log --oneline"
alias gsh="git show --word-diff=color"
alias gcm="git add . ; git commit"
# alias gcm="git commit -am"
alias gbr="git branch"
alias gpr="git pull --rebase"
alias gco="git checkout"
#  last = 'log -1 HEAD'
alias glol="git log --oneline -1"
alias glolx='git log --oneline -1; git log --oneline -1 | xclip -selection c'

# Book Grep - greps books and provides the line number
brep() { grep -rin --exclude-dir=tmp --exclude-dir=.git "$1" .; }
alias vlg="head -1 | vl -"

# redshift
# sets the valua 4200 straight away -- see man redshift
alias rso="redshift -O 4200"
# resets redshift -- default settings
alias rsx="redshift -x"

# explain.sh begins
# http://www.tecmint.com/explain-shell-commands-in-the-linux-shell/
# explain () {
#   if [ "$#" -eq 0 ]; then
#     while read  -p "Command: " cmd; do
#       curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-$
#     done
#     echo "Bye!"
#   elif [ "$#" -eq 1 ]; then
#     curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-ur$
#   else
#     echo "Usage"
#     echo "explain                  interactive mode."
#     echo "explain 'cmd -o | ...'   one quoted command to explain it."
#   fi
# }

# Tab: Cycle thru completion
# bind '"\t":menu-complete'

# Midnight Commander exits to the directory of the active panel instead of the directory mc was started from.
# alias mc=". /usr/share/mc/bin/mc-wrapper.sh" FIXME doesn't work
# mc='. /usr/libexec/mc/mc-wrapper.sh' FIXME from a Fedora forum - doesn't work either

# Color for manpages in less makes manpages a little easier to read -- I can't see any difference
#export LESS_TERMCAP_mb=$'\E[01;31m'
#export LESS_TERMCAP_md=$'\E[01;31m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;44;33m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;32m'
