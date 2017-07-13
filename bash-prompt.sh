#!/bin/bash
#2009-14-16-17 tiagobrait


#if we are on a non-interactive shell, skip this whole novel
if [[ $- != *i* ]]; then
  unset PS1
  return
fi

GIT_PROMPT="/usr/share/git/git-prompt.sh"

if [ -f $GIT_PROMPT ]; then
    source $GIT_PROMPT
    export GIT_PS1_SHOWDIRTYSTATE=yes
    export GIT_PS1_SHOWUNTRACKEDFILES=yes
fi

__set_prompts(){
    #last command exit status
    local RET="$?"
    #color for the prompts
    local RED='\[[31m\]'
    local GRE='\[[32m\]'
    local YEL='\[[33m\]'
    local BLU='\[[34m\]'
    local MAG='\[[35m\]'
    local BLD='\[[1m\]'
    local RST='\[[0m\]'
    #check git_ps1 and set its output
    if declare -f __git_ps1 > /dev/null; then
        GIT_PS=`__git_ps1 " ${RST}${MAG}%s${RST}"`
    else
        GIT_PS=''
    fi
    #simple last command status to be shown in the prompt
    [[ $RET -ne 0  ]] && RET="[${RST}${RED}${BLD}${RET}${RST}]" || RET="${RST}"
    #set the prompts
    if [ $EUID == 0 ]; then
        PS1="${RET}[${RED}\\u${RST}@${GRE}\\h${RST} ${YEL}\\W${RST}${GIT_PS}]\\$ "
    else
        PS1="${RET}[${BLU}\\u${RST}@${GRE}\\h${RST} ${YEL}\\W${RST}${GIT_PS}]\\$ "

    fi
    PS2="${BLD}>>${RST} "
    PS3="[1m?>[0m "
    PS4='+[0m ${BASH_SOURCE}:${LINENO}:${FUNCNAME}>[0m '
}

__set_prompts_nocolor(){
    local RET="$?"
    if declare -f __git_ps1 > /dev/null; then
        GIT_PS=$(__git_ps1 " %s")
    else
        GIT_PS=''
    fi
    [[ $RET -ne 0  ]] && RET="[${RET}]" || RET=''
    PS1="${RET}[\\u@\\h \\W${GIT_PS}]\\$ "
    PS2=">> "
    PS3="?> "
    PS4='+ ${BASH_SOURCE}:${LINENO}:${FUNCNAME}> '
}
