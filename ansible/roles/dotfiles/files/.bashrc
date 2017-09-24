# /etc/skel/.bashrc
alias ll="ls -lah"
alias ipa="ip a"

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

function _foreground_calc {
    # thanks centos
    shasum_cmd=$(which shasum || echo sha1sum)
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

. /etc/bash_completion

export TERMINFO=/etc/terminfo
export TERM=xterm

ARCH='x64'
PATH="$PATH:/sbin:/usr/sbin/:/home/slobber/bin"
EDITOR="vim"
HISTFILESIZE=10000
HISTTIMEFORMAT="%h/%d -- %H:%M:%S "

hostnamecolor=$(_foreground_calc $HOSTNAME)
PS1='\[\033k\033\\\]\[\e[32m\]\u@\[\e[38;5;${hostnamecolor}m\]\h \[\e[32m\]\w \j\[\e[0m\] \$ '

fortune | cowsay
echo "~~~~~~~~~~~^^^^^^^^^^^^^^^^^^~~~~~~~~~"
uptime
echo
screen -ls
