# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
PROMPT_DIRTRIM=3

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Github token: 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

# Navigation Functions
function open() 
{
    if [ $1 -eq 620 ]; then
	cd /media/orlando21/DATA/UPenn/Courses/MEAM620AdvancedRobotics/Projects/Project$2/meam620/
    elif [ $1 -eq 560 ]; then
	cd /media/orlando21/DATA/UPenn/Courses/CIS560ComputerGraphics/HomeworkAssignments/HW$2/
    fi
}

# Personal Aliases
alias links='vim ~/Documents/links'
alias books='cd /media/orlando21/DATA/DATA_Documents/Books/'
alias courses='cd /media/orlando21/DATA/UPenn/Courses/'
alias 560='cd /media/orlando21/DATA/UPenn/Courses/CIS560ComputerGraphics'
alias 519='cd /media/orlando21/DATA/UPenn/Courses/CIS519AppliedMachineLearning'
alias 620='cd /media/orlando21/DATA/UPenn/Courses/MEAM620AdvancedRobotics'
alias 650='cd /media/orlando21/DATA/UPenn/Courses/ESE650LearningInRobotics'
alias 546='cd /media/orlando21/DATA/UPenn/Courses/ESE546PrinciplesOfDeepLearning'
alias 520='cd /media/orlando21/DATA/UPenn/Courses/MEAM520IntroToRobotics'
alias gcm='export GCM_CREDENTIAL_STORE=cache'
alias sem_slam='cd /media/orlando21/DATA/UPenn/Courses/ESE650LearningInRobotics/FinalProject/sem_slam_ws'
alias ros_ip='source ~/Documents/UsefullFiles/ros_master_ip.sh'
alias use_nvidia='source /usr/local/bin/enable_nvidia_graphics_card'
alias snake_server='cd /media/orlando21/DATA/Games_Created/SnakeGameMultiplayer/server/; npx nodemon server.js'
alias snake_run='cd /media/orlando21/DATA/Games_Created/SnakeGameMultiplayer/frontend/; npx live-server'
alias bck_sync='bash ~/backup_sync/sync_directories.sh'
alias src='source /home/orlando21/meam520_ws/devel_isolated/setup.bash'
alias build='cd /home/orlando21/meam520_ws/ && catkin_make_isolated'
export PYTHONPATH="${PYTHONPATH}:/home/${USER}/meam520_ws/src/meam520_labs"

# ROS aliases
alias noetic='source /opt/ros/noetic/setup.bash'
alias foxy='source /opt/ros/foxy/setup.bash'

alias f1car='ssh nvidia@192.168.86.55'
alias nano0='ssh orlando21@192.168.0.100'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/orlando21/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/orlando21/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/orlando21/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/orlando21/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<


# ROS1 Configurations
# source /opt/ros/noetic/setup.bash	# source the ROS1 distribution version
# source ~/catkin_ws/devel/setup.bash
# source /media/orlando21/DATA/UPenn/Courses/ESE650LearningInRobotics/FinalProject/sem_slam_ws/devel/setup.bash
# source /home/orlando21/auto_stack_ws/devel/setup.bash
# source /home/orlando21/eth_mpc_ws/devel/setup.bash
# source /home/orlando21/uzh_mpc_ws/devel/setup.bash


# ROS2 Configurations
# source /opt/ros/foxy/setup.bash

# ROS_DOMAIN_ID: The domain ID is used to segment the network in order to avoid interference
# between different groups of computers running ROS 2 on the same local area network.
# Machines with different domain IDs will not talk, nor interfere, with each other.
export ROS_DOMAIN_ID=7
# Limit ROS2 communication to the local host
#export ROS_LOCALHOST_ONLY=0
# Change directories to any package in ROS2
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=/opt/ros/foxy
# Enable tab completion for colcon
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash



