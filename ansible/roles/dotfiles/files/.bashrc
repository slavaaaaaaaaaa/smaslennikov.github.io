# /etc/skel/.bashrc

# append to the history file, don't overwrite it
shopt -s histappend

alias ll="ls -lah"
alias ipa="ip a"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [[ $- != *i* ]] ; then
  return
fi

function _branch_show() {
  git branch 2> /dev/null | grep -e "^*" | cut -d' ' -f 2 | sed -e 's/$/ /g'
}

function _foreground_calc {
  # thanks centos
  shasum_cmd=$(which shasum  2>/dev/null || echo sha1sum)
  # reject these colors for being too dark
  local reject=([0]=a [16]=a [17]=a [18]=a [19]=a [232]=a [233]=a [234]=a [235]=a [236]=a [237]=a [238]=a)
  echo "$1" | $shasum_cmd | while read -n2 num; do
  local num=$((16#$num))
  if [ -z "${reject[$num]}" ]; then
    echo $num
    return
  fi
  done
}

export ANSIBLE_NOCOWS=1
export ARCH='x64'
export EDITOR="vim"
export GPG_TTY=$(tty)
export HISTSIZE=20000
export HISTFILESIZE=40000
export HISTTIMEFORMAT="%h/%d -- %H:%M:%S "
export PATH="/usr/local/bin:$PATH:/sbin:/usr/sbin/:$HOME/bin"
export LD_LIBRARY_PATH=/usr/local/lib
export PS1='\[\033k\033\\\]\[\e[32m\]\u@\[\e[38;5;${hostnamecolor}m\]\h \[\e[32m\]\w \[\033[33m\]$(_branch_show)\[\e[32m\]\j\[\e[0m\] \$ '
export hostnamecolor=$(_foreground_calc $HOSTNAME)

fortune | cowsay -y
echo "~~~~~~~~~~~^^^^^^^^^^^^^^^^^^~~~~~~~~~"
uptime
echo
screen -ls

[ -f /Users/slava/.travis/travis.sh ] && source /Users/slava/.travis/travis.sh
if which rbenv &> /dev/null; then eval "$(rbenv init -)"; fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /etc/profile.d/bash_completion.sh ] && . /etc/profile.d/bash_completion.sh

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
