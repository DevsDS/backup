# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases

if [ -f /home/shmily/.dir_colors ]; then
	echo "test...1"
	eval `dircolors ~/.dir_colors`
	alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
	echo "test...2"
	if [ -x /usr/bin/dircolors ]; then
    	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    	alias ls='ls --color=auto'
    	#alias dir='dir --color=auto'
    	#alias vdir='vdir --color=auto'

    	alias grep='grep --color=auto'
    	alias fgrep='fgrep --color=auto'
    	alias egrep='egrep --color=auto'
		fi
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PS1="\[\e[0;36m\]\u\[\e[m\]@\[\e[0;32m\]\h: \[\e[0;35m\]\W\[\e[m\] \\$  "

#export PATH=/usr/arm/toolschain/4.3.2/bin:$PATH

#export PATH=/home/embedded/tools/bin:$PATH

# the next is for anderiod
#export PATH=/home/shmily/arm-linux/Android/toolchain/arm-eabi-4.4.3/bin:$PATH
#export JAVA_HOME=/usr/local/java/jdk1.6.0_32
#export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#export PATH=$PATH:$JAVA_HOME/bin
#export PATH=/home/shmily/arm-linux/Android/ICS/out/host/linux-x86/bin:$PATH
#export ANDROID_SWT=/home/shmily/arm-linux/Android/ICS/out/host/linux-x86/framework
# end of anderiod


#export PATH=/home/shmily/arm-linux/R-PI/tools/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin:$PATH
#export PATH=/home/shmily/arm-linux/Tiny210/toolschain/4.5.1/bin:$PATH
#export PATH=/home/shmily/arm-linux/Cubieboard/toolschain/bin:$PATH
#export PATH=/home/shmily/Android/bin:$PATH

export PATH=/home/shmily/arm-linux/stm32-toolchain/gcc-cortex/bin:$PATH

# for ns-2.35
#export PATH=/home/shmily/arm-linux/AODV/ns-allinone-2.35/bin:$PATH
#export PATH=/home/shmily/arm-linux/AODV/ns-allinone-2.35/tcl8.5.10/unix:$PATH
#export PATH=/home/shmily/arm-linux/AODV/ns-allinone-2.35/tk8.5.10/unix:$PATH

#export LD_LIBRARY_PATH=/home/shmily/arm-linux/AODV/ns-allinone-2.35/otcl-1.14:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/home/shmily/arm-linux/AODV/ns-allinone-2.35/lib:$LD_LIBRARY_PATH

#export TCL_LIBRARY=/home/shmily/arm-linux/AODV/ns-allinone-2.35/tcl8.5.10/library:$TCL_LIBRARY


# for ns-2.32
export PATH=/home/shmily/arm-linux/AODV/ns-allinone-2.32/bin:$PATH
export PATH=/home/shmily/arm-linux/AODV/ns-allinone-2.32/tcl8.4.15/unix:$PATH
export PATH=/home/shmily/arm-linux/AODV/ns-allinone-2.32/tk8.4.15/unix:$PATH

export LD_LIBRARY_PATH=/home/shmily/arm-linux/AODV/ns-allinone-2.32/otcl-1.13:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/shmily/arm-linux/AODV/ns-allinone-2.32/lib:$LD_LIBRARY_PATH

export TCL_LIBRARY=/home/shmily/arm-linux/AODV/ns-allinone-2.32/tcl8.4.15/library:$TCL_LIBRARY
